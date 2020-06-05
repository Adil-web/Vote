<html>
    <head>
        <meta charset="utf-8">
        <title>Global survey</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="/css/vote.css">
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-12 p-2 header-survey">
                    <h3>Опрос: ваша самая мимишная живность</h3>
                </div>
                <div class="col-6 m-0 p-1 d-flex flex-wrap align-items-center justify-content-center body-survey">
                    <h5 class="col-12">Голоcование - радио кнопками</h5>
                    <form action="/results/" method="POST" class="survey-text">
                            <label for="id_cats">Кошка:</label>
                            <input name="survey" type="radio" id="id_cats" value="cats" checked>
                        
                            <label for="id_dogs">Собака:</label>
                            <input name="survey" type="radio" id="id_dogs" value="dogs">
                       
                            <label for="id_parrots">Попугай:</label>
                            <input name="survey" type="radio" id="id_parrots" value="parrots">                        
                        <div class="col-12 p-1 survey-text"><input value="Голосуй!" type="submit" /></div>
                    </form>
                </div>
                <div class="col-6 m-0 p-1 d-flex flex-wrap align-items-center justify-content-center body-survey">
                    <h5 class="col-12">Голосование - обычные кнопки</h5>
                    <div class="col-12 p-1">
                        <label for="id_cats_button">Кошка:</label>
                        <input value="Мяу!!!" type="submit" id="id_cats_button">
                    </div>

                    <div class="col-12 p-1">
                        <label for="id_dogs_button">Песик:</label>
                        <input value="Гав!!!" type="submit" id="id_dogs_button">
                    </div>                        
                        
                    <div class="col-12 p-1">
                        <label for="id_parrots_button">Попугай:</label>
                        <input value="Ррома!" type="submit" id="id_parrots_button"/>
                    </div>                    
                </div>

            </div>
        </div>
    <script>
        const catsURL = new URL('{{protocol}}://{{host}}:{{port}}/sse/vote/cats');
        const dogsURL = new URL('{{protocol}}://{{host}}:{{port}}/sse/vote/dogs');
        const parrotsURL = new URL('{{protocol}}://{{host}}:{{port}}/sse/vote/parrots');
    </script>
    <script type="text/javascript" src="/src/vote.js"></script>
    </body>
</html>
