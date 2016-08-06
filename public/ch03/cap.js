(function(window) {
    var calc = function(x, y) {
        var result = x/y;
        return util(result);        //반올림
    };

    var util = function(num) {
        return Math.round(num);
    }
    
    window.calc = calc;
})(window);