require('UIView, UIColor, UILabel');
var temp;
defineClass('YOYO:UIViewController' ,{
  jsView : function(){
  	return temp;
  },
  setJsView : function(one){
    temp = one;
  },
});
