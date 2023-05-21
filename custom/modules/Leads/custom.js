function check_items(form,field,value,number){for(i=0;i<number;i++){if(form.elements[i].name==field)
form.elements[i].checked=value;}}

sugarListView.prototype.check=function (form,field,value,number){for(i=0;i<number;i++){if(form.elements[i].name==field)
form.elements[i].checked=value;}}

sugarListView.check = sugarListView.prototype.check;