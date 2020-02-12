<!-- MODALS -->
  <!-- Quick bar -->
  <aside id="ms-quick-bar" class="ms-quick-bar fixed ms-d-block-lg">

      <ul class="nav nav-tabs ms-quick-bar-list" role="tablist">

          <li class="ms-quick-bar-item ms-has-qa" role="presentation" data-toggle="tooltip" data-placement="left" title="Launch To-do-list" data-title="To-do-list">
              <a href="#qa-toDo" aria-controls="qa-toDo" role="tab" data-toggle="tab">
                  <i class="flaticon-list"></i>

              </a>
          </li>
          <li class="ms-quick-bar-item ms-has-qa" role="presentation" data-toggle="tooltip" data-placement="left" title="Launch Reminders" data-title="Reminders">
              <a href="#qa-reminder" aria-controls="qa-reminder" role="tab" data-toggle="tab">
                  <i class="flaticon-bell"></i>

              </a>
          </li>
          <li class="ms-quick-bar-item ms-has-qa" role="presentation" data-toggle="tooltip" data-placement="left" title="Launch Notes" data-title="Notes">
              <a href="#qa-notes" aria-controls="qa-notes" role="tab" data-toggle="tab">
                  <i class="flaticon-pencil"></i>

              </a>
          </li>
          <li class="ms-quick-bar-item ms-has-qa" role="presentation" data-toggle="tooltip" data-placement="left" title="Invite Members" data-title="Invite Members">
              <a href="#qa-invite" aria-controls="qa-invite" role="tab" data-toggle="tab">
                  <i class="flaticon-share-1"></i>

              </a>
          </li>
          <li class="ms-quick-bar-item ms-has-qa" role="presentation" data-toggle="tooltip" data-placement="left" title="Settings" data-title="Settings">
              <a href="#qa-settings" aria-controls="qa-settings" role="tab" data-toggle="tab">
                  <i class="flaticon-gear"></i>

              </a>
          </li>
      </ul>
      <div class="ms-configure-qa" data-toggle="tooltip" data-placement="left" title="Configure Quick Access">

          <a href="#">
              <i class="flaticon-hammer"></i>

          </a>

      </div>

      <!-- Quick bar Content -->
      <div class="ms-quick-bar-content">

          <div class="ms-quick-bar-header clearfix">
              <h5 class="ms-quick-bar-title float-left">Title</h5>
              <button type="button" class="close ms-toggler" data-target="#ms-quick-bar" data-toggle="hideQuickBar" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          </div>

          <div class="ms-quick-bar-body tab-content">



              <div role="tabpanel" class="tab-pane" id="qa-toDo">
                  <div class="ms-quickbar-container ms-todo-list-container ms-scrollable">

                      <form class="ms-add-task-block">
                          <div class="form-group mx-3 mt-0  fs-14 clearfix">
                              <input type="text" class="form-control fs-14 float-left" id="task-block" name="todo-block" placeholder="Add Task Block" value="">
                              <button type="submit" class="ms-btn-icon bg-primary float-right"><i class="material-icons text-disabled">add</i></button>
                          </div>
                      </form>

                      <ul class="ms-todo-list">
                          <li class="ms-card ms-qa-card ms-deletable">

                              <div class="ms-card-header clearfix">
                                  <h6 class="ms-card-title">Task Block Title</h6>
                                  <button data-toggle="tooltip" data-placement="left" title="Add a Task to this block" class="ms-add-task-to-block ms-btn-icon float-right"> <i class="material-icons text-disabled">add</i> </button>
                              </div>

                              <div class="ms-card-body">
                                  <ul class="ms-list ms-task-block">
                                      <li class="ms-list-item ms-to-do-task ms-deletable">
                                          <label class="ms-checkbox-wrap ms-todo-complete">
                                              <input type="checkbox" value="">
                                              <i class="ms-checkbox-check"></i>
                                          </label>
                                          <span> Task to do </span>
                                          <button type="submit" class="close"><i class="flaticon-trash ms-delete-trigger"> </i></button>
                                      </li>
                                      <li class="ms-list-item ms-to-do-task ms-deletable">
                                          <label class="ms-checkbox-wrap ms-todo-complete">
                                              <input type="checkbox" value="">
                                              <i class="ms-checkbox-check"></i>
                                          </label>
                                          <span>Task to do</span>
                                          <button type="submit" class="close"><i class="flaticon-trash ms-delete-trigger"> </i></button>
                                      </li>
                                  </ul>
                              </div>

                              <div class="ms-card-footer clearfix">
                                  <a href="#" class="text-disabled mr-2"> <i class="flaticon-archive"> </i> Archive </a>
                                  <a href="#" class="text-disabled  ms-delete-trigger float-right"> <i class="flaticon-trash"> </i> Delete </a>
                              </div>

                          </li>
                      </ul>

                  </div>
              </div>

              <div role="tabpanel" class="tab-pane" id="qa-reminder">
                  <div class="ms-quickbar-container ms-reminders">

                      <ul class="ms-qa-options">
                          <li> <a href="#" data-toggle="modal" data-target="#reminder-modal"> <i class="flaticon-bell"></i> New Reminder </a> </li>
                      </ul>

                      <div class="ms-quickbar-container ms-scrollable">

                          <div class="ms-card ms-qa-card ms-deletable">
                              <div class="ms-card-body">
                                  <p> Developer Meeting in Block B </p>
                                  <span class="text-disabled fs-12"><i class="material-icons fs-14">access_time</i> Today - 3:45 pm</span>
                              </div>
                              <div class="ms-card-footer clearfix">

                                  <div class="ms-note-editor float-right">
                                      <a href="#" class="text-disabled mr-2" data-toggle="modal" data-target="#reminder-modal"> <i class="flaticon-pencil"> </i> Edit </a>
                                      <a href="#" class="text-disabled  ms-delete-trigger"> <i class="flaticon-trash"> </i> Delete </a>
                                  </div>

                              </div>
                          </div>
                          <div class="ms-card ms-qa-card ms-deletable">
                              <div class="ms-card-body">
                                  <p> Start adding change log to version 2 </p>
                                  <span class="text-disabled fs-12"><i class="material-icons fs-14">access_time</i> Tomorrow - 12:00 pm</span>
                              </div>
                              <div class="ms-card-footer clearfix">

                                  <div class="ms-note-editor float-right">
                                      <a href="#" class="text-disabled mr-2" data-toggle="modal" data-target="#reminder-modal"> <i class="flaticon-pencil"> </i> Edit </a>
                                      <a href="#" class="text-disabled  ms-delete-trigger"> <i class="flaticon-trash"> </i> Delete </a>
                                  </div>

                              </div>
                          </div>

                      </div>

                  </div>
              </div>

              <div role="tabpanel" class="tab-pane" id="qa-notes">

                  <ul class="ms-qa-options">
                      <li> <a href="#" data-toggle="modal" data-target="#notes-modal"> <i class="flaticon-sticky-note"></i> New Note </a> </li>
                      <li> <a href="#"> <i class="flaticon-excel"></i> Export to Excel </a> </li>
                  </ul>

                  <div class="ms-quickbar-container ms-scrollable">

                      <div class="ms-card ms-qa-card ms-deletable">
                          <div class="ms-card-header">
                              <h6 class="ms-card-title">Don't forget to check with the designer</h6>
                          </div>
                          <div class="ms-card-body">
                              <p>
                                  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vulputate urna in faucibus venenatis. Etiam at dapibus neque,
                                  vel varius metus. Pellentesque eget orci malesuada, venenatis magna et
                              </p>
                              <ul class="ms-note-members clearfix mb-0">
                                  <li class="ms-deletable"> <img src="assets/img/people/people-3.jpg" alt="member"> </li>
                                  <li class="ms-deletable"> <img src="assets/img/people/people-5.jpg" alt="member"> </li>
                              </ul>
                          </div>
                          <div class="ms-card-footer clearfix">

                              <div class="dropdown float-left">
                                  <a href="#" class="text-disabled" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                      <i class="flaticon-share-1"></i> Share
                                  </a>
                                  <ul class="dropdown-menu">
                                      <li class="dropdown-menu-header">
                                          <h6 class="dropdown-header ms-inline m-0"><span class="text-disabled">Share With</span></h6>
                                      </li>
                                      <li class="dropdown-divider"></li>
                                      <li class="ms-scrollable ms-dropdown-list ms-members-list">
                                          <a class="media p-2" href="#">
                                              <div class="mr-2 align-self-center">
                                                  <img src="assets/img/people/people-10.jpg" class="ms-img-round" alt="people">
                                              </div>
                                              <div class="media-body">
                                                  <span>John Doe</span>
                                              </div>
                                          </a>
                                          <a class="media p-2" href="#">
                                              <div class="mr-2 align-self-center">
                                                  <img src="assets/img/people/people-9.jpg" class="ms-img-round" alt="people">
                                              </div>
                                              <div class="media-body">
                                                  <span>Raymart Sandiago</span>
                                              </div>
                                          </a>
                                          <a class="media p-2" href="#">
                                              <div class="mr-2 align-self-center">
                                                  <img src="assets/img/people/people-7.jpg" class="ms-img-round" alt="people">
                                              </div>
                                              <div class="media-body">
                                                  <span>Heather Brown</span>
                                              </div>
                                          </a>
                                      </li>
                                  </ul>
                              </div>
                              <div class="ms-note-editor float-right">
                                  <a href="#" class="text-disabled mr-2" data-toggle="modal" data-target="#notes-modal"> <i class="flaticon-pencil"> </i> Edit </a>
                                  <a href="#" class="text-disabled  ms-delete-trigger"> <i class="flaticon-trash"> </i> Delete </a>
                              </div>

                          </div>
                      </div>

                      <div class="ms-card ms-qa-card ms-deletable">
                          <div class="ms-card-header">
                              <h6 class="ms-card-title">Perform the required unit tests</h6>
                          </div>
                          <div class="ms-card-body">
                              <p>
                                  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vulputate urna in faucibus venenatis. Etiam at dapibus neque,
                                  vel varius metus. Pellentesque eget orci malesuada, venenatis magna et
                              </p>
                              <ul class="ms-note-members clearfix mb-0">
                                  <li class="ms-deletable"> <img src="assets/img/people/people-9.jpg" alt="member"> </li>
                              </ul>
                          </div>
                          <div class="ms-card-footer clearfix">

                              <div class="dropdown float-left">
                                  <a href="#" class="text-disabled" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                      <i class="flaticon-share-1"></i> Share
                                  </a>
                                  <ul class="dropdown-menu">
                                      <li class="dropdown-menu-header">
                                          <h6 class="dropdown-header ms-inline m-0"><span class="text-disabled">Share With</span></h6>
                                      </li>
                                      <li class="dropdown-divider"></li>
                                      <li class="ms-scrollable ms-dropdown-list ms-members-list">
                                          <a class="media p-2" href="#">
                                              <div class="mr-2 align-self-center">
                                                  <img src="assets/img/people/people-10.jpg" class="ms-img-round" alt="people">
                                              </div>
                                              <div class="media-body">
                                                  <span>John Doe</span>
                                              </div>
                                          </a>
                                          <a class="media p-2" href="#">
                                              <div class="mr-2 align-self-center">
                                                  <img src="assets/img/people/people-9.jpg" class="ms-img-round" alt="people">
                                              </div>
                                              <div class="media-body">
                                                  <span>Raymart Sandiago</span>
                                              </div>
                                          </a>
                                          <a class="media p-2" href="#">
                                              <div class="mr-2 align-self-center">
                                                  <img src="assets/img/people/people-7.jpg" class="ms-img-round" alt="people">
                                              </div>
                                              <div class="media-body">
                                                  <span>Heather Brown</span>
                                              </div>
                                          </a>
                                      </li>
                                  </ul>
                              </div>
                              <div class="ms-note-editor float-right">
                                  <a href="#" class="text-disabled mr-2" data-toggle="modal" data-target="#notes-modal"> <i class="flaticon-pencil"> </i> Edit </a>
                                  <a href="#" class="text-disabled  ms-delete-trigger"> <i class="flaticon-trash"> </i> Delete </a>
                              </div>

                          </div>
                      </div>

                  </div>

              </div>

              <div role="tabpanel" class="tab-pane" id="qa-invite">

                  <div class="ms-quickbar-container text-center ms-invite-member">
                      <i class="flaticon-network"></i>
                      <p>Invite Team Members</p>
                      <form>
                          <div class="ms-form-group">
                              <input type="text" placeholder="Member Email" class="form-control" name="invite-email" value="">
                          </div>
                          <div class="ms-form-group">
                              <button type="submit" name="invite-member" class="btn btn-primary w-100">Invite</button>
                          </div>
                      </form>
                  </div>

              </div>

              <div role="tabpanel" class="tab-pane" id="qa-settings">

                  <div class="ms-quickbar-container text-center ms-invite-member">
                      <div class="row">
                          <div class="col-md-12 text-left mb-5">
                              <h4 class="section-title bold">Customize</h4>
                              <div>
                                  <label class="ms-switch">
                                      <input type="checkbox" id="dark-mode">
                                      <span class="ms-switch-slider round"></span>
                                  </label>
                                  <span> Dark Mode </span>
                              </div>
                              <div>
                                  <label class="ms-switch">
                                      <input type="checkbox" id="remove-quickbar">
                                      <span class="ms-switch-slider round"></span>
                                  </label>
                                  <span> Remove Quickbar </span>
                              </div>
                          </div>
                          <div class="col-md-12 text-left">
                              <h4 class="section-title bold">Keyboard Shortcuts</h4>
                              <p class="ms-directions mb-0"><code>Esc</code> Close Quick Bar</p>
                              <p class="ms-directions mb-0"><code>Alt + (1 -&gt; 6)</code> Open Quick Bar Tab</p>
                              <p class="ms-directions mb-0"><code>Alt + Q</code> Enable Quick Bar Configure Mode</p>

                          </div>
                      </div>
                  </div>

              </div>

          </div>

      </div>
  </aside>

<!-- Reminder Modal -->
  <div class="modal fade" id="reminder-modal" tabindex="-1" role="dialog" aria-labelledby="reminder-modal">
      <div class="modal-dialog modal-dialog-centered" role="document">
          <div class="modal-content">
              <div class="modal-header bg-secondary">
                  <h5 class="modal-title has-icon text-white"> New Reminder</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                  </button>
              </div>
              <form>
                  <div class="modal-body">
                      <div class="ms-form-group">
                          <label>Remind me about</label>
                          <textarea class="form-control" name="reminder"></textarea>
                      </div>
                      <div class="ms-form-group"> <span class="ms-option-name fs-14">Repeat Daily</span>
                          <label class="ms-switch float-right">
                              <input type="checkbox"> <span class="ms-switch-slider round"></span>
                          </label>
                      </div>
                      <div class="row">
                          <div class="col-md-6">
                              <div class="ms-form-group">
                                  <input type="text" class="form-control datepicker" name="reminder-date" value="" />
                              </div>
                          </div>
                          <div class="col-md-6">
                              <div class="ms-form-group">
                                  <select class="form-control" name="reminder-time">
                                      <option value="">12:00 pm</option>
                                      <option value="">1:00 pm</option>
                                      <option value="">2:00 pm</option>
                                      <option value="">3:00 pm</option>
                                      <option value="">4:00 pm</option>
                                  </select>
                              </div>
                          </div>
                      </div>
                  </div>
                  <div class="modal-footer">
                      <button type="button" class="btn btn-light" data-dismiss="modal">Close</button>
                      <button type="button" class="btn btn-secondary shadow-none" data-dismiss="modal">Add Reminder</button>
                  </div>
              </form>
          </div>
      </div>
  </div>
  <!-- Notes Modal -->
  <div class="modal fade" id="notes-modal" tabindex="-1" role="dialog" aria-labelledby="notes-modal">
      <div class="modal-dialog modal-dialog-centered" role="document">
          <div class="modal-content">
              <div class="modal-header bg-secondary">
                  <h5 class="modal-title has-icon text-white" id="NoteModal">New Note</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                  </button>
              </div>
              <form>
                  <div class="modal-body">
                      <div class="ms-form-group">
                          <label>Note Title</label>
                          <input type="text" class="form-control" name="note-title" value="">
                      </div>
                      <div class="ms-form-group">
                          <label>Note Description</label>
                          <textarea class="form-control" name="note-description"></textarea>
                      </div>
                  </div>
                  <div class="modal-footer">
                      <button type="button" class="btn btn-light" data-dismiss="modal">Close</button>
                      <button type="button" class="btn btn-secondary shadow-none" data-dismiss="modal">Add Note</button>
                  </div>
              </form>
          </div>
      </div>
  </div>