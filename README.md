Dorkbots-PureMVC Root View
=================

This frameworks servers as a means to encapsulate the view specific technology (Stage 3D, DisplayList and SWCs for assets). It is difficult to practice inheritance when using SWC files, it's cumbersome to have base classes when using SWCs in a pure ActionScript project. So this framework serves as a means of composition over inheritance, view components encapsulate the View Objects enabling the ability to add project wide functionality via inheritance in the Component View’s to View Objects. View Objects are focused on view specific technology, and view components are focused on adding functionality. PureMVC drives this example but the Root View framework can be used outside of it. 

This examples demonstrates three different approaches for dealing with views.
1. Loading View Components into the Root View
2. Loading View Components into a View Composite that is a child of the Root View
3. Loading an app via PureMVC and adding the apps View Component to the Root View

http://www.dorkbots.com/repositories/root-view

Author: Dayvid jones
http://www.dayvid.com
Copyright (c) Disco Blimp 2014
http://www.discoblimp.com