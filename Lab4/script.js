function boton1(){
    var n= prompt("");
    var i;
    var aux, cubo;
    parseInt(n);


    for( i=0; i <n; n--) {

            aux = n**2;
            cubo= n**3;


        document.write(" "+aux+"  <br>");
        document.write("   "+cubo+"   ");
    }

}

function suma() {
    var num1, num2;



    num1 =  parseInt((Math.random() * 100) + 1);
    num2 =  parseInt((Math.random() * 100) + 1);

    var aux = new Date();
    var n= prompt("cual es la suma de "+ num1 +" + "+num2);
    var aux2 = new Date();






    if((num1+num2)==n){
        document.write("correcto <br>");

    }else{
        document.write("incorrecto <br>");
        }

    document.write("Respondiste en "+(aux2.getTime()-aux.getTime())/1000+ " segundos");

}


function contador() {
    var arg =[];
    var j ;
    var neutro= 0, negativo= 0 , positivo= 0;
    for( j=0; j <10; j++) {
        arg[j] = parseInt(((Math.random() * 100) + 1 )*(Math.random()*2-1));

        if (arg[j] == 0) {
            neutro++;
        } else if (arg[j] > 0) {
            positivo++;
        } else {
            negativo++;
        }
    }
    
    document.write("Número de positivos: " + positivo+"<br>");
    document.write("Numero de negativos: "+ negativo+"<br>");
    document.write("Numero de neutros: "+ neutro+"<br>");

}


function promedios(){
  var  arg= [  [20, 10, 5],
        [50, 20, 15],
        [80,510,5]
    ]
    var i, j, promedio=[], prom;

        for (i=0; i<3; i++ ){
            prom = 0;
            for(j=0; j<3; j++){
                prom = prom + arg[i][j];
            }
            prom = prom/3;
            promedio.push(prom);
            document.write((promedio[i])+"<br>");
        }


    }

    
    function inverso() {
        var n= prompt("ingrese un numero");
            var split= n.split("");
        var reverse = split.reverse();
        var  inverted = reverse.join("");
        document.write(inverted);


    }