var $form = $('#formulario'),
	$titulo = $('#titulo'),
	$url = $('#url'),
	$publicar = $('#mostrarform'),
	$lista = $('#contenido'),
	$primerPost = $('.item').first(); //selecciona el primero

// Funciones
// programo las funciones de los eventos

function showHideForm(e)
{
	e.preventDefault();
	$form.slideToggle(); //muestra el elemento con ease
	$lista.slideToggle();
	//muestra $form y oculta $lista
	//return false; // prevent default y stop bobbling. evita el link hacia #
}

function agregarPost(e)
{
	e.preventDefault();
	// val es funcion de jquery
	// considera el valor entre ()
	// clone es funcion de jquery
	// clona la variable declarada
	var titulo = $titulo.val(),
		url = $url.val(),
		clon = $primerPost.clone();

	// find es funcion de jquery
	// es encontrar el selector css
	// y su etiqueta correspondiente
	// text es funcion de jquery
	// reemplazara el anchor
	// anterior por la variable entre 
	// sus ()
	clon.find('.titulo_item a')
	.text(titulo)
	.attr('href', url);

	// display none
	clon.hide();

	// append coloca al ultimo lugar
	// prepend coloca al primer lugar
	$lista.prepend(clon);
	showHideForm(); //llamo la funcion de mostrar form
	// val es un get. aqui le asigno un valor
	// vacio que hace que se borre
	$titulo.val('');
	$url.val('');
	// animacion de colocacion
	clon.slideDown();

	//return false;
}

// Eventos
// Declaro eventos que tienen funciones
$publicar.click( showHideForm ); //funcion conocida de jquery es click
$form.on( 'submit', agregarPost );


/* Comandos de jquery

var nav = document.getElementsByTagName('nav')
// esto es javascript

$('nav')
// esto es jquery osom
//dentro del () se escribe igual que en css

$('#publicar_nav').siblings()
// siblings selecciona todos los hermanos del seleccionado
// excepto el seleccionado

$('selector').parent()
// selecciona el padre del selector

$('selector').parent().parent()
$('selector').parents('selector')

.remove() //quitar elemento
.attr('style', 'background: red') //reemplaza atributos
.css('background', 'red') //lo mismo de arriba
// pero nunca se modifica un estilo css
// desde jquery ni javascript
// los css se hacen en css
// en jquery se interactua cambiando ids o clases
.addClass('selector')
.removeClass() //quita clase
.hasClass() // pregunta en la consola si tiene la clase
.toggleClass() // if tiene, desactiva. if no tiene, activa
$(selector tag).html('valor')
//selecciona un tag y reemplazo el html
//el valor puede contener lo que se hace en html y css

*/