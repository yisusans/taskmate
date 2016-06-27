var Group = function(params) {
  params = params || {}
  this.name = params.name || "Group";
  this.users = params.users || [];
  this.tasks = params.tasks || [];
  this.invites = params.invites || [];
  this.conversation = params.conversation || null;
};
