//
//  TaggableTextView.h
//  tagg
//
//  Created by Deep Patel on 3/5/14.
//  Copyright (c) 2014 Deep Patel. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "TagsTable.h"
#import "TagField.h"
@interface TaggableTextView : UITextView <UITableViewDataSource, UITableViewDelegate, UITextViewDelegate, UITextFieldDelegate>

@property (strong,nonatomic) UITableView *tableView;
@property (strong,nonatomic) UITextField *tagField;
@property (strong, nonatomic) NSArray *tagSource;
@property (strong, nonatomic) NSMutableArray *visibleRows;
@property (strong, nonatomic) NSString *tagPrefix;
@property (nonatomic, assign) BOOL cachedMode;
@property (strong, nonatomic) id tableViewClass;
@property (strong, nonatomic) id textFieldClass;
-(void) makeTaggable;
-(NSArray*) tagsForQuery: (NSString*) query;
-(void) didTagItemAt: (NSNumber*) i;

@end
