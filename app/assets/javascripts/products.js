$(window).ready(function(){

  var blingItems = new Bloodhound({
    datumTokenizer: Bloodhound.tokenizers.obj.whitespace('value'),
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    remote: '/?search=%QUERY'
  });

  blingItems.initialize();

  $('.typeahead').typeahead(null, {
    name: 'search',
    displayKey: 'title',
    source: blingItems.ttAdapter()
  }).on("typeahead:selected", function (event, data, dataset) {
      // console.log("data", data);
      window.location.href = "/?search=" + encodeURIComponent(data.title);
    });
});
