function something()
  {
    var x = window.localStorage.getItem('vvv'); // x = hh['vvv']

    x = x * 1 + 1; // x = x + 1

    window.localStorage.setItem('vvv', x); // hh['vvv'] = x

    alert(x);
  }

  function add_to_cart()
  {
    alert('Hello from function!');
  }

