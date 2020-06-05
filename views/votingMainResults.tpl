<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Survey results</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>
    <section class="mt-5 d-flex justify-content-center">
        <h5>Котики</h5>
        <div class="progress col-4">
            <div class="progress-bar progress-bar-cats progress-bar-striped bg-success survey-bar" role="progressbar" style="width: 0%" aria-valuenow="0" aria-valuemin="0"
                aria-valuemax="100"></div>
        </div>
    </section>
    <section class="mt-5 d-flex justify-content-center">
        <h5>Песики</h5>
        <div class="progress col-4 d-flex justify-content-left">
            <div class="progress-bar progress-bar-dogs progress-bar-striped bg-success survey-bar" role="progressbar" style="width: 0%" aria-valuenow="0" aria-valuemin="0"
                aria-valuemax="100"></div>
        </div>
    </section>
    <section class="mt-5 d-flex justify-content-center">
        <h5>Попугайчики</h5>
        <div class="progress col-4 d-flex justify-content-left">
            <div class="progress-bar progress-bar-parrots progress-bar-striped bg-success survey-bar" role="progressbar" style="width: 0%" aria-valuenow="0" aria-valuemin="0"
                aria-valuemax="100"></div>
        </div>
    </section>
    <section class="mt-5 d-flex justify-content-around">
        <div>
            <label for="id_check" class="h6">Отобразить %</label>
            <input name="check" type="checkbox" id="id_check">
        </div> 
        <p class="h6 total-count"></p>      
    </section>
    <script>
        const url = new URL('{{protocol}}://{{host}}:{{port}}/sse/vote/stats');
    </script>
    <script type="text/javascript" src="/src/results.js"></script>
</body>
</html>