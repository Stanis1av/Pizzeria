function something()
  {
    var x = window.localStorage.getItem('vvv'); // x = hh['vvv']

    x = x * 1 + 1; // x = x + 1

    window.localStorage.setItem('vvv', x); // hh['vvv'] = x

    alert(x);
  }

  function add_to_cart(id)
  {
    var key = 'product_' + id, x;
    var x = window.localStorage.getItem(key);
    x = x * 1 + 1;
    window.localStorage.setItem(key, x);

    update_orders_input();
    update_orders_button();
  }

  function update_orders_input()
  {
    var orders = cart_get_orders();
    $('#orders_input').val(orders);
  }

  function update_orders_button()
  {
    var text = 'Cart (' + cart_get_number_of_item() + ')';
    $('#orders_button').val(text);

  }



  function cart_get_number_of_item()
  {
    var cnt = 0;

    for(var i = 0; i < window.localStorage.length; i++)
    {
      var key = window.localStorage.key(i); // Получение ключа
      var value = window.localStorage.getItem(key); // Получение значений, hh[key] = x

      if(key.indexOf('product_') == 0)
      {
        cnt = cnt + value * 1;
      }
    }
    return cnt;
  }

  function cart_get_orders()
  {
    var orders = '';

    for(var i = 0; i < window.localStorage.length; i++)
    {
      var key = window.localStorage.key(i); // Получение ключа
      var value = window.localStorage.getItem(key); // Получение значений, hh[key] = x

      if(key.indexOf('product_') == 0)
      {
        orders = orders + key + '=' + value + ',';
      }
    }
    return orders;
  }
// not work
function cancel_order() 
{
  window.localStorage.clear();

  update_orders_button();
  update_orders_input();

   $('#cart').text('Your cart is now empty')

  return false;
}