<?php
/*
\site\controller.php
general controller

When no task is given in the request variables, the default task will be executed. It's the display task by default. The JControllerLegacy class has such a task. In our example, it will display a view named restaurants.

So with task simply a public function display() of JControllerLegacy is refered to.

A Tip!
you could call another function aside from display() by using an URL like this one:
http://localhost/veganpittsburgh.org/index.php?option=com_restaurant&task=insert\
This would try to call a function insert() of our controller (which we would actually have to implement in HelloWorldController ).

*/
defined('_JEXEC') or die;

class restaurantController extends JControllerLegacy{}