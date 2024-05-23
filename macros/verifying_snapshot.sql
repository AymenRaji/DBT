{%  macro verifying_snapshot(verifying_table = 'all_snapshots') %}
    
     {% set graph_nodes = graph.nodes.values() %}
    {% if verifying_table == 'all_snapshots' %}
        {% for node in graph_nodes %}
            {% if node.materialized == 'table' and node.depends_on.nodes is not none %}
                {{ log(node.unique_id ~ ", " ~ node.name ~ " found", info=true) }}
            {% endif %}
        {% endfor %}
    {% elif verifying_table!= 'all_snapshots' %}
        {% if graph.nodes.{{verifying_table}} is not none %}
            {% for node in graph.nodes.{{verifying_table}} info=true %}
                {{ log(node.name ~ " depends_on: " ~ node.depends_on.nodes info=true) }}
            {% endfor %}
        {% else %}
            {{ log("No nodes found under verifying_table." info=true) }}
        {% endif %}
    {% else %}
        {{ log("Invalid condition encountered." info=true) }}
    {% endif %}

{% endmacro %}