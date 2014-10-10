//
//  TaggableTextView.m
//  tagg
//
//  Created by Deep Patel on 3/5/14.
//  Copyright (c) 2014 Deep Patel. All rights reserved.
//

#import "TaggableTextView.h"

@implementation TaggableTextView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setDelegate:self];
        self.layer.borderColor = [[UIColor blackColor] CGColor];
        self.layer.borderWidth = 2;
        self.tagPrefix = @"@";
        self.tagSource = nil;
        self.tableView.rowHeight = 40.0;
        self.tableViewClass = [UITableView class];
        self.textFieldClass = [UITextField class];
    }
    return self;
}

- (void)makeTaggable {
    _tableView = [[_tableViewClass alloc] initWithFrame: [[UIScreen mainScreen] bounds]];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [[self superview] addSubview:_tableView];
    
    _tagField = [[_textFieldClass alloc] init];
    _tagField.delegate = self;
    [self.superview addSubview:_tagField];
    
    if (_tagSource)
        _cachedMode = YES;
    else
        _cachedMode = NO;
    
    [self exitTaggingMode];
}

- (void) refreshVisibleRows {
    _visibleRows = [[NSMutableArray alloc] init];
    NSString *temp = [[_tagField.text lowercaseString] substringFromIndex: 1];
    if (!_cachedMode) {
        _tagSource = [self tagsForQuery: _tagField.text];
    }
    if ([_tagField.text isEqualToString: _tagPrefix] || (!_cachedMode))
    {
        [_tagSource enumerateObjectsUsingBlock:^(id x, NSUInteger index, BOOL *stop){
            [_visibleRows addObject: [NSNumber numberWithInteger:index]];
        }];

    } else {
        [_tagSource enumerateObjectsUsingBlock:^(id x, NSUInteger index, BOOL *stop){
            if ([[x lowercaseString] rangeOfString:  temp].location != NSNotFound)
            {
                [_visibleRows addObject: [NSNumber numberWithInteger:index]];
            }
        }];
    }
    [_tableView reloadData];
}


- (void)textViewDidChange:(TaggableTextView *)textView
{
    if([textView.text hasSuffix: _tagPrefix]){
        [self enterTaggingMode];
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if(range.location == 0){
        self.text = [self.text substringToIndex: self.text.length - 1];
        [self exitTaggingMode];
    } else {
        _tagField.text = [_tagField.text stringByReplacingCharactersInRange:range withString:string];
        [self refreshVisibleRows];
    }
    return false;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_visibleRows count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    id cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@""];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@""];
    }
        [[cell textLabel] setText: [_tagSource objectAtIndex: [[_visibleRows objectAtIndex: indexPath.row] integerValue]]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self exitTaggingMode];
    [self setText: [self.text stringByAppendingString: [tableView cellForRowAtIndexPath:indexPath].textLabel.text]];
    [self didTagItemAt: [_visibleRows objectAtIndex: indexPath.row]];
}
-(void) enterTaggingMode{
    [_tagField setHidden:NO];
    [_tableView setHidden:NO];
    [_tagField becomeFirstResponder];
    [self setHidden:YES];
    _tagField.text = _tagPrefix;
    [self refreshVisibleRows];
}
-(void) exitTaggingMode{
    [_tagField setHidden:YES];
    [_tableView setHidden:YES];
    [self becomeFirstResponder];
    [self setHidden:NO];
}

-(void) didTagItemAt: (NSNumber*) i {
}

-(NSArray*) tagsForQuery: (NSString*) query {
    return @[@"This should not happen"];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
