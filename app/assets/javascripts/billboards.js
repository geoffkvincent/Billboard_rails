
function incrementValue(event)
{
   var value = parseInt(event.target.textContent);
   value = isNaN(value) ? 0 : value;
   value++;
   event.target.textContent = value.toString()
  
}

