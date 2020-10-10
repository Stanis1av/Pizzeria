function something()
  {
    var x = window.localStorage.getItem('vvv');

    x = x * 1 + 1

    window.localStorage.setItem('vvv', x);

    alert(x);
  }

