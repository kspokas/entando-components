INSERT INTO widgetcatalog (code, titles, parameters, plugincode, parenttypecode, defaultconfig, locked, maingroup) VALUES ('entando-widget-meeting_list-purple', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
    <property key="en">Meeting calendar list Inspinia</property>
    <property key="it">Meeting calendar list Inspinia</property>
</properties>', NULL, NULL, NULL, NULL, 1, NULL);

INSERT INTO guifragment (code, widgettypecode, plugincode, gui, defaultgui, locked) VALUES ('entando-widget-meeting_list-purple', 'entando-widget-meeting_list-purple', NULL, NULL, '<#assign wp=JspTaglibs["/aps-core"]>
<@wp.info key="langs" var="langsVar" />
<@wp.info key="currentLang" var="currentLangVar" />
<div class="ibox float-e-margins">
                                <div class="ibox-title">
                                    <h5>Calendar Activities</h5>
                                    <div class="ibox-tools">
                                        <a class="collapse-link">
                                            <i class="fa fa-chevron-up"></i>
                                        </a>
                                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                            <i class="fa fa-wrench"></i>
                                        </a>
                                        <ul class="dropdown-menu dropdown-user">
                                            <li><a href="#">Config option 1</a>
                                            </li>
                                            <li><a href="#">Config option 2</a>
                                            </li>
                                        </ul>
                                        <a class="close-link">
                                            <i class="fa fa-times"></i>
                                        </a>
                                    </div>
                                </div>
                                <div class="ibox-content ibox-heading">
                                    <h3>You have meeting today!</h3>
                                    <small><i class="fa fa-map-marker"></i> Meeting is on 6:00am. Check your schedule to see detail.</small>
                                </div>
                                <div class="ibox-content inspinia-timeline">

                                    <div class="timeline-item">
                                        <div class="row">
                                            <div class="col-xs-3 date">
                                                <i class="fa fa-briefcase"></i>
                                                6:00 am
                                                <br>
                                                <small class="text-navy">2 hour ago</small>
                                            </div>
                                            <div class="col-xs-7 content no-top-border">
                                                <p class="m-b-xs"><strong>Meeting</strong></p>

                                                <p>Conference on the sales results for the previous year. Monica please examine sales trends in marketing and products. Below please find the current status of the
                                                    sale.</p>

                                                <p><span data-diameter="40" class="updating-chart" style="display: none;">6,5,9,4,7,3,2,9,8,7,4,5,1,2,9,5,4,7,2,7,7,3,5,2,0,1,7,9,3,3,8,8,10,3,6,7,7</span><svg class="peity" height="16" width="64"><polygon fill="#1ab394" points="0 15 0 6.5 1.7777777777777777 8 3.5555555555555554 2 5.333333333333333 9.5 7.111111111111111 5 8.88888888888889 11 10.666666666666666 12.5 12.444444444444443 2 14.222222222222221 3.5 16 5 17.77777777777778 9.5 19.555555555555554 8 21.333333333333332 14 23.11111111111111 12.5 24.888888888888886 2 26.666666666666664 8 28.444444444444443 9.5 30.22222222222222 5 32 12.5 33.77777777777778 5 35.55555555555556 5 37.33333333333333 11 39.11111111111111 8 40.888888888888886 12.5 42.666666666666664 15.5 44.44444444444444 14 46.22222222222222 5 48 2 49.77777777777777 11 51.55555555555555 11 53.33333333333333 3.5 55.11111111111111 3.5 56.888888888888886 0.5 58.666666666666664 11 60.44444444444444 6.5 62.22222222222222 5 64 5 64 15"></polygon><polyline fill="transparent" points="0 6.5 1.7777777777777777 8 3.5555555555555554 2 5.333333333333333 9.5 7.111111111111111 5 8.88888888888889 11 10.666666666666666 12.5 12.444444444444443 2 14.222222222222221 3.5 16 5 17.77777777777778 9.5 19.555555555555554 8 21.333333333333332 14 23.11111111111111 12.5 24.888888888888886 2 26.666666666666664 8 28.444444444444443 9.5 30.22222222222222 5 32 12.5 33.77777777777778 5 35.55555555555556 5 37.33333333333333 11 39.11111111111111 8 40.888888888888886 12.5 42.666666666666664 15.5 44.44444444444444 14 46.22222222222222 5 48 2 49.77777777777777 11 51.55555555555555 11 53.33333333333333 3.5 55.11111111111111 3.5 56.888888888888886 0.5 58.666666666666664 11 60.44444444444444 6.5 62.22222222222222 5 64 5" stroke="#169c81" stroke-width="1" stroke-linecap="square"></polyline></svg></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="timeline-item">
                                        <div class="row">
                                            <div class="col-xs-3 date">
                                                <i class="fa fa-file-text"></i>
                                                7:00 am
                                                <br>
                                                <small class="text-navy">3 hour ago</small>
                                            </div>
                                            <div class="col-xs-7 content">
                                                <p class="m-b-xs"><strong>Send documents to Mike</strong></p>
                                                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="timeline-item">
                                        <div class="row">
                                            <div class="col-xs-3 date">
                                                <i class="fa fa-coffee"></i>
                                                8:00 am
                                                <br>
                                            </div>
                                            <div class="col-xs-7 content">
                                                <p class="m-b-xs"><strong>Coffee Break</strong></p>
                                                <p>
                                                    Go to shop and find some products.
                                                    Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s.
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="timeline-item">
                                        <div class="row">
                                            <div class="col-xs-3 date">
                                                <i class="fa fa-phone"></i>
                                                11:00 am
                                                <br>
                                                <small class="text-navy">21 hour ago</small>
                                            </div>
                                            <div class="col-xs-7 content">
                                                <p class="m-b-xs"><strong>Phone with Jeronimo</strong></p>
                                                <p>
                                                    Lorem Ipsum has been the industry''s standard dummy text ever since.
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="timeline-item">
                                        <div class="row">
                                            <div class="col-xs-3 date">
                                                <i class="fa fa-user-md"></i>
                                                09:00 pm
                                                <br>
                                                <small>21 hour ago</small>
                                            </div>
                                            <div class="col-xs-7 content">
                                                <p class="m-b-xs"><strong>Go to the doctor dr Smith</strong></p>
                                                <p>
                                                    Find some issue and go to doctor.
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="timeline-item">
                                        <div class="row">
                                            <div class="col-xs-3 date">
                                                <i class="fa fa-comments"></i>
                                                12:50 pm
                                                <br>
                                                <small class="text-navy">48 hour ago</small>
                                            </div>
                                            <div class="col-xs-7 content">
                                                <p class="m-b-xs"><strong>Chat with Monica and Sandra</strong></p>
                                                <p>
                                                    Web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).
                                                </p>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>', 1);
