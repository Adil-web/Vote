const vote = async function(URI) {
            let promise = await fetch(URI, { method: 'POST', headers: Headers });
            if (!promise.ok) {
                alert('Ошибка связи с сервером!')
            }
            location.href = '/results/';
        }
const cats = document.querySelector('#id_cats_button');
const dogs = document.querySelector('#id_dogs_button');
const parrots = document.querySelector('#id_parrots_button');

const header = new Headers({
        'Access-Control-Allow-Credentials': true,
        'Access-Control-Allow-Origin': '*'
})
cats.addEventListener('click', () => vote(catsURL));
dogs.addEventListener('click', () => vote(dogsURL));
parrots.addEventListener('click', () => vote(parrotsURL));