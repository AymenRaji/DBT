{% macro limit_data_in_dev(columen_name, number_of_days=3)%}
 {%if target.name == 'default'%}
    where {{columen_name}} >= dateadd('day', -{{number_of_days}}, current_timestamp) 
 {%endif%}

{%endmacro%}