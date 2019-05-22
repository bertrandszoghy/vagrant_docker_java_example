angular.module('app.services', []).factory('Performer', function($resource) {
  return $resource('/api/v1/performers/:id', { id: '@id' }, {
    update: {
      method: 'PUT'
    }
  });
}).service('popupService',function($window){
    this.showPopup=function(message){
        return $window.confirm(message);
    }
});
