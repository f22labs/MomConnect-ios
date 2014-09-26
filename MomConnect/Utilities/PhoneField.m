//
//  PhonField.m
//  MomConnect
//
//  Created by HariHaraSudhan on 27/09/14.
//  Copyright (c) 2014 F22Labs. All rights reserved.
//

#import "PhoneField.h"

@implementation PhoneField

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
//
//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
//    NSString* totalString = [NSString stringWithFormat:@"%@%@",textField.text,string];
//    
//    // if it's the phone number textfield format it.
//    if(textField.tag==102 ) {
//        if (range.length == 1) {
//            // Delete button was hit.. so tell the method to delete the last char.
//            textField.text = [self formatPhoneNumber:totalString deleteLastChar:YES];
//        } else {
//            textField.text = [self formatPhoneNumber:totalString deleteLastChar:NO ];
//        }
//        return false;
//    }
//    
//    return YES; 
//}
//
//-(NSString*) formatPhoneNumber:(NSString*) simpleNumber deleteLastChar:(BOOL)deleteLastChar {
//    if(simpleNumber.length==0) return @"";
//    // use regex to remove non-digits(including spaces) so we are left with just the numbers
//    NSError *error = NULL;
//    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[\\s-\\(\\)]" options:NSRegularExpressionCaseInsensitive error:&error];
//    simpleNumber = [regex stringByReplacingMatchesInString:simpleNumber options:0 range:NSMakeRange(0, [simpleNumber length]) withTemplate:@""];
//    
//    // check if the number is to long
//    if(simpleNumber.length>10) {
//        // remove last extra chars.
//        simpleNumber = [simpleNumber substringToIndex:10];
//    }
//    
//    if(deleteLastChar) {
//        // should we delete the last digit?
//        simpleNumber = [simpleNumber substringToIndex:[simpleNumber length] - 1];
//    }
//    
//    // 123 456 7890
//    // format the number.. if it's less then 7 digits.. then use this regex.
//    if(simpleNumber.length<7)
//        simpleNumber = [simpleNumber stringByReplacingOccurrencesOfString:@"(\\d{3})(\\d+)"
//                                                               withString:@"($1) $2"
//                                                                  options:NSRegularExpressionSearch
//                                                                    range:NSMakeRange(0, [simpleNumber length])];
//    
//    else   // else do this one..
//        simpleNumber = [simpleNumber stringByReplacingOccurrencesOfString:@"(\\d{3})(\\d{3})(\\d+)"
//                                                               withString:@"($1) $2-$3"
//                                                                  options:NSRegularExpressionSearch
//                                                                    range:NSMakeRange(0, [simpleNumber length])];
//    return simpleNumber;
//}

@end
