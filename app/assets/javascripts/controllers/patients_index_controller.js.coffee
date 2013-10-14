Acme.PatientsIndexController = Ember.ArrayController.extend
  filteredModels: []

  actions:
    search: ->
      console.log 'search'
      filterText = @get 'searchText'
      if filterText? && filterText.length > 0
        searchProperty = if isNaN(filterText) then 'full_lowercase_name' else 'mrn'

        regex = new RegExp(filterText)
        @set('filteredModels', @get('model').filter((patient) ->
          return regex.test(patient.get(searchProperty))))
          #('full_lowercase_name', filterText))
      else
        @set('filteredModels', @get('model'))
