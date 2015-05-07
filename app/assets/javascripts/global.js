$(function() {
  $(".form-login form").click(function(e) {
    e.stopPropagation();
  });

  $("textarea").sceditor({
      plugins: "bbcode",
      toolbar: "bold,italic|center|size|quote,image,link,unlink|source",
      emoticonsEnabled: false,
      style: ""
  });
});
