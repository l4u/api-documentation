(function() {
  var item = $("#sidebar nav")
    .find("ul > li")
      .addClass("collapsed")
    .end()
    .find("a[href='" + window.location.pathname + "']")
      .parent("li")
        .addClass("active")
      .end()
      .parents("li");

  if (item.children("ul").length > 0) {
    item
      .addClass("expanded")
      .removeClass("collapsed");
  }
})();
