const header = new Headers({
        'Access-Control-Allow-Credentials': true,
        'Access-Control-Allow-Origin': '*'
    });

//    const url = new URL('http://localhost:{{port}}/sse/vote/stats');
//урл создаем в инлайновом js чтобы передать параметры подключения через шаблон
    const ES = new EventSource(url, header);

    const progressCats = document.querySelector('.progress-bar-cats');
    const progressDogs = document.querySelector('.progress-bar-dogs');
    const progressParrots = document.querySelector('.progress-bar-parrots');
    const checkBox = document.querySelector('#id_check')
    const totalCount = document.querySelector('.total-count')

    ES.onerror = error => {
        ES.readyState ? alert("что-то пошло не так!") : null;
    };

    ES.onmessage = message => {
        msg_ = JSON.parse(message.data);
        sum_ = msg_.cats + msg_.dogs + msg_.parrots;
        
        cats_ = Math.round(msg_.cats / sum_ * 100);
        dogs_ = Math.round(msg_.dogs / sum_ * 100);
        parrots_ = Math.round(msg_.parrots / sum_ *100);

        if (checkBox.checked){
            cats_perc = Math.round(msg_.cats / sum_ * 100);
            dogs_perc = Math.round(msg_.dogs / sum_ * 100);
            parrots_perc = Math.round(msg_.parrots / sum_ *100);
            end_ = '%'
        }
        else{
            cats_perc = msg_.cats;
            dogs_perc = msg_.dogs;
            parrots_perc = msg_.parrots;
            end_ = ''
        }
        totalCount.innerText = `всего: ${sum_}`;
        progressCats.style.cssText = `width: ${cats_}%;`
        progressCats.textContent = `${cats_perc}${end_}`

        progressDogs.style.cssText = `width: ${dogs_}%;`
        progressDogs.textContent = `${dogs_perc}${end_}`

        progressParrots.style.cssText = `width: ${parrots_}%;`
        progressParrots.textContent = `${parrots_perc}${end_}`
    };