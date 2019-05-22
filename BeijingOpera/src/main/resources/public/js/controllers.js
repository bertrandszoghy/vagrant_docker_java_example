angular.module('app.controllers', []).controller('PerformerListController', function($scope, $state, popupService, $window, Performer) {
  $scope.performers = Performer.query(); //fetch all performers. Issues a GET to /api/vi/performers

  $scope.deletePerformer = function(performer) { // Delete a Performer. Issues a DELETE to /api/v1/performers/:id
    if (popupService.showPopup('Really delete this?')) {
      performer.$delete(function() {
        $scope.performers = Performer.query(); 
        $state.go('performers');
      });
    }
  };
}).controller('PerformerViewController', function($scope, $stateParams, Performer) {
  $scope.performer = Performer.get({ id: $stateParams.id }); //Get a single performer.Issues a GET to /api/v1/performers/:id
}).controller('PerformerCreateController', function($scope, $state, $stateParams, Performer) {
  $scope.performer = new Performer();  //create new performer instance. Properties will be set via ng-model on UI

  $scope.addPerformer = function() { //create a new performer. Issues a POST to /api/v1/performers
    $scope.performer.$save(function() {
      $state.go('performers'); // on success go back to the list i.e. performers state.
    });
  };
}).controller('PerformerEditController', function($scope, $state, $stateParams, Performer) {
  $scope.updatePerformer = function() { //Update the edited performer. Issues a PUT to /api/v1/performers/:id
    $scope.performer.$update(function() {
      $state.go('performers'); // on success go back to the list i.e. performers state.
    });
  };

  $scope.loadPerformer = function() { //Issues a GET request to /api/v1/performers/:id to get a performer to update
    $scope.performer = Performer.get({ id: $stateParams.id });
  };

  $scope.loadPerformer(); // Load a performer which can be edited on UI
});
