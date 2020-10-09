@include("layout.header")
<div id="buscadormap" gpk="{{env('GOOGLE_API_KEY')}}" ></div>
<script src="{{ asset('js/app.js') }}" ></script>
@include("layout.footer")