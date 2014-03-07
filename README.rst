TaggableTextView
================

Customizable UITextView subclass that supports tagging.



How to use it.
--------------

.. code-block:: objective-c

  //REQUIRED
  _text_view = [[TaggableTextViewSubclass alloc] initWithFrame: CGRectMake(20, 200, 280, 100)];
  [_text_view setText:@"This text is taggable"];
  
  //Optional customization
  _text_view.tagPrefix = @"#"; // It is '@' by default 
  _text_view.tableViewClass = [YourTableViewSubclass class];
  _text_view.textFieldClass = [YourTextFieldSubclass class];
  
  //REQUIRED
  [_text_view makeTaggable];
  [self.view addSubview:_text_view];

Data Source
-----------
You can give it all your tags like:

.. code-block:: objective-c

  _text_view.tagSource = @[@"Deep Patel", @"whoever else"];
  
Or if you are pulling from an api you can subclass TaggableTextView and implement:

.. code-block:: objective-c

  -(NSArray*) tagsForQuery: (NSString*) query;

The Tag event
-------------
Make sure you implement this in your subclass
.. code-block:: objective-c
  -(void) didTagItemAt: (NSNumber*) i;

