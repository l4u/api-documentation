(function() {
  if (!document.querySelector) {
    return;
  }

  var nav = document.querySelector("#sidebar nav"),
      items = nav.querySelectorAll("ul > li"),
      active = nav.querySelector("a[href='" + window.location.pathname + "']");

  for (var index = 0; index < items.length; index++) {
    items[index].className = "collapsed";
  }

  if (active) {
    var item = active.parentNode,
        parent = item.parentNode.parentNode;

    item.className = "active";

    if (parent.nodeName == "LI") {
      parent.className = "active expanded";
    } else {
      item.className += " expanded";
    }
  }
})();
