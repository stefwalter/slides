/* Included after reveal.js */
Reveal.initialize({
	controls: true,
	progress: true,
	history: true,
	center: true,

	transition: 'fade', // none/fade/slide/convex/concave/zoom

	// Optional reveal.js plugins
	dependencies: [
		{ src: 'reveal/lib/js/classList.js', condition: function() {
			return !document.body.classList; }
		},
		{ src: 'reveal/plugin/markdown/marked.js', condition: function() {
			return !!document.querySelector( '[data-markdown]' ); }
		},
		{ src: 'reveal/plugin/markdown/markdown.js', condition: function() {
			return !!document.querySelector( '[data-markdown]' ); }
		},
		{ src: 'reveal/plugin/highlight/highlight.js', async: true, callback: function() {
			hljs.initHighlightingOnLoad(); }
		},
		{ src: 'reveal/plugin/zoom-js/zoom.js', async: true },
		{ src: 'reveal/plugin/notes/notes.js', async: true }
	]
});

/* Printing and PDF exports */
var link = document.createElement( 'link' );
link.rel = 'stylesheet';
link.type = 'text/css';
link.href = window.location.search.match( /print-pdf/gi ) ? 'css/print/pdf.css' : 'css/print/paper.css';
document.getElementsByTagName( 'head' )[0].appendChild( link );
