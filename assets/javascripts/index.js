var path = location.pathname;
if ( path.indexOf('/projects/goods-request') == 0 ) {
    // Inside project!
    // Rename labels and links
    $$('#main-menu a.roadmap'  ).shift().innerHTML = 'Кварталы';
    $$('#main-menu a.issues'   ).shift().innerHTML = 'Заявки';
    $$('#main-menu a.new-issue').shift().innerHTML = 'Новая заявка';

    if ( path.indexOf('/projects/goods-request/issues/new') == 0 ) {
    
        var calc_total = function() {
            $('issue_custom_field_values_11').value
                = $F('issue_custom_field_values_9') * $F('issue_custom_field_values_10')
        }

        // Found page with form
        // Hide elements
        $($('issue_tracker_id').parentNode).hide();
        $($('issue_estimated_hours').parentNode).hide();

        // Disable calculated field
        $('issue_custom_field_values_11').disable();

        // Bind event listener
        $('issue_custom_field_values_9' ).onchange = calc_total;
        $('issue_custom_field_values_10').onchange = calc_total;
        $('issue-form'                  ).onsubmit = calc_total;

        $$('div#content h2').shift().innerHTML = 'Новая заявка';
        $$('[for=issue_fixed_version_id]').shift().innerHTML = 'Квартал';
        $$('[for=issue_category_id]').shift().innerHTML = 'Код по классификатору';
        


    } // if page

    


} // if project