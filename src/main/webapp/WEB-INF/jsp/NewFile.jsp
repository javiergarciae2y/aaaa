<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>SVG Circliful</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/resources/css/jquery.circliful.css">

    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<section class="container">

    <h3>Circliful</h3>

    <div class="row">
        <div class="col-lg-2">
            <div id="test-circle"></div>
        </div>
        <div class="col-lg-2">
            <div id="test-circle2"></div>
        </div>
        <div class="col-lg-2">
            <div id="test-circle3"></div>
        </div>
        <div class="col-lg-2">
            <div id="test-circle4"></div>
        </div>
        <div class="col-lg-2">
            <div id="test-circle5"></div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-2">
            <div id="test-circle6"></div>
        </div>
    </div>

</section>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="/resources/js/jquery.circliful.js"></script>
<script>
    $( document ).ready(function() { // 6,32 5,38 2,34
        $("#test-circle").circliful({
            animation: 1,
            animationStep: 5,
            foregroundBorderWidth: 15,
            backgroundBorderWidth: 15,
            percent: 38,
            textSize: 28,
            textStyle: 'font-size: 12px;',
            textColor: '#666',
        });
        $("#test-circle2").circliful({
            animation: 0,
            animationStep: 6,
            foregroundBorderWidth: 5,
            backgroundColor: "none",
            fillColor: '#eee',
            percent: 50,
            iconColor: '#3498DB',
            icon: 'f206',
            iconSize: '40',
            iconPosition: 'middle'
        });
        $("#test-circle3").circliful({
            animation: 1,
            animationStep: 6,
            foregroundBorderWidth: 5,
            backgroundBorderWidth: 1,
            percent: 88,
            iconColor: '#3498DB',
            icon: 'f004',
            iconSize: '40',
            iconPosition: 'middle'
        });
        $("#test-circle4").circliful({
            animation: 1,
            animationStep: 1,
            target: 10,
            start: 2,
            showPercent: 1,
            backgroundColor: '#000',
            foregroundColor: '#A8C64A',
            fontColor: '#000',
            iconColor: '#000',
            icon: 'f0a0',
            iconSize: '40',
            iconPosition: 'middle',
            text: 'No Kids'
        });
        $("#test-circle5").circliful({
            animationStep: 5,
            foregroundBorderWidth: 5,
            backgroundBorderWidth: 15,
            percent: 80,
            icon: 'f0a0',
            iconPosition: 'middle',
            text: 'Space Left',
            textBelow: true
        });
        $("#test-circle6").circliful({
            animation: 1,
            animationStep: 5,
            foregroundBorderWidth: 7,
            backgroundBorderWidth: 7,
            textSize: 28,
            textStyle: 'font-size: 12px;',
            textColor: '#666',
            multiPercentage: 1,
            percentages: [
                {'percent': 10, 'color': '#3180B8', 'title': 'Gryffindor' },
                {'percent': 30, 'color': '#4ADBEA', 'title': 'Ravenclaw' },
                {'percent': 50, 'color': '#49EBA8', 'title': 'Hufflepuff' },
                {'percent': 70, 'color': '#FFCA35', 'title': 'Slytherin' }
            ],
            multiPercentageLegend: 1,
            replacePercentageByText: '',
            backgroundColor: '#eee',
            icon: 'f0d0',
            iconPosition: 'middle',
            iconColor: '#273B4E'
        });
    });
</script>
</body>
</html>
