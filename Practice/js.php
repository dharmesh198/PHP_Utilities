<html>
    <head>
        <title> JS Practice </title>
        <script language="javascript">
        function OnSubmit(){
            var strVal = document.getElementById('demo').value;
            /*
            var arrCars = ['honda', 'toyota', 'chevy'];
            alert(arrCars[0]);
            alert(arrCars[1]);
            */
            //alert(strVal);
            
            var person = {name:'Dharmesh',age:33, city:'San Diego'}
            document.getElementById('idPara').innerHTML = person.name + 's age is '+ person.age + ' and he lives in ' + person.city;
        }
        
        function changeImg(){
            alert('Image name before: ' + document.getElementById('myImage').src);
            document.getElementById('myImage').src = 'test2.png';
            alert('Image name after: ' + document.getElementById('myImage').src);
        }
        
        function hideImg(handle){
            if(handle.value == 'Show Image'){
                document.getElementById('myImage').style.display = '';
                handle.value = 'Hide Image';
            }else{
                document.getElementById('myImage').style.display = 'none';
                handle.value = 'Show Image';
            }
        }
        
        function changeTextBox(){
            
            var x = document.getElementById('fname');
            x.value = x.value.toUpperCase();
        }
        </script>
        
        <style>
            body {background-color: powderblue}
            p {font-family: verdana; text-align: center}
        </style>
    </head>
    
    <body>
        <h1 style="color:blue">Heading</h1>
        <p title="I'm a tooltip" id='idPara'>This is a paragraph.</p>
        <input type="button" id='demo' name="nmSubmit" value="Go" onclick="OnSubmit()">
        <a href="test.php">This is a link</a>
        
        <img id="myImage" src="test.png" style="width:100px;">
        <input type="button" onclick="changeImg();" value="Change Image">
        <input type="button" onclick="hideImg(this);" value="Hide Image">
        
        <br><br>
        <input type="text" id="fname" value="" onblur="changeTextBox();">
    </body>
</html>