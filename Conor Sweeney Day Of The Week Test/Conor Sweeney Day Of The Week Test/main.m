//
//  main.m
//  Conor Sweeney Day Of The Week Test
//
//  Created by Conor Sweeney on 11/7/15.
//  Copyright © 2015 Conor Sweeney. All rights reserved.
//

#import <Foundation/Foundation.h>

//The program requires that AD years be positive and that BC years be negative. The program also will return error for any dates during the year 0 since it did not occur.

void dayOfWeek(long year, int month, int day){
    //set start date to use as reference 1/1/2016: Friday
    int flag = 0;
    
    //Check that day exists
    if(year == 0){
        flag = 0;
    }
    else if (month <=12 && month > 0) {
        if (month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12) {
            if (day > 31 || day < 1) {
                flag = 0;
            }
            else{
                flag = 1;
            }
        }
        else if(month == 4 || month == 6 || month == 9 || month == 11){
            if (day > 30 || day < 1) {
                flag = 0;
            }
            else{
                flag = 1;
            }
        }
        else if (month == 2){
            if (year % 4 == 0) {
                if (day > 29 || day < 1 ) {
                    flag = 0;
                }
                else
                    flag = 1;
            }
            else if (day > 28 || day < 1){
                flag = 0;
            }
            else{
                flag = 1;
            }
        }
    }
    
    // if day exists
    if (flag == 1) {
        //calculate for dates after reference date
        int dayFlag = 0;
        long tempDay = 0;
        long tempDayAfterYearFound = 0;
        if (year >= 2016) {
            long yearDifference = year - 2016;
            tempDay = 4;
            for (int i = 1; i <= yearDifference; i++) {
                if (i % 4 != 1) {
                    tempDay = tempDay + 1;
                }
                else if (i % 4 == 1){
                    tempDay = tempDay + 2;
                }
            }
        }
        else if (year < 2016 && year > 0) {
            long yearDifference = 2016 - year;
            tempDay = 4;
            for (int i = 1; i <= yearDifference; i++) {
                if (i % 4 != 3) {
                    tempDay = tempDay - 1;
                }
                else if (i % 4 == 3){
                    tempDay = tempDay - 2;
                }
            }

        }
        else if (year < 0){
            long yearDifference = 2016 - year;
            tempDay = 0;
            for (int i = 1; i <= yearDifference; i++) {
                if (i % 4 != 3) {
                    tempDay = tempDay - 1;
                }
                else if (i % 4 == 3){
                    tempDay = tempDay - 2;
                }
            }
        }
        //calculate days into the year
        for (int i = 1; i < month; i++) {
            if (i == 1 || i == 3 || i == 5 || i == 7 || i == 8 || i == 10 || i == 12) {
                tempDayAfterYearFound = tempDayAfterYearFound +  31;
            }
            else if(i == 4 || i == 6 || i == 9 || i == 11){
                tempDayAfterYearFound = tempDayAfterYearFound + 30;
            }
            else if(i == 2){
                if (year % 4 == 0) {
                    tempDayAfterYearFound = tempDayAfterYearFound + 29;
                }
                else
                    tempDayAfterYearFound = tempDayAfterYearFound + 28;
            }
        }
        
        dayFlag = (tempDayAfterYearFound +tempDay + day) % 7;
        if (dayFlag == 0){
            NSLog (@"%d/%d/%ld is a Sunday",month,day,year);
        }
        else if (dayFlag == 1 || dayFlag == -1){
            NSLog (@"%d/%d/%ld is a Monday",month,day,year);
        }
        else if (dayFlag == 2 || dayFlag == -2){
            NSLog (@"%d/%d/%ld is a Tuesday",month,day,year);
        }
        else if (dayFlag == 3 || dayFlag == -3){
            NSLog (@"%d/%d/%ld is a Wednesday",month,day,year);
        }
        else if (dayFlag == 4 || dayFlag == -4){
            NSLog (@"%d/%d/%ld is a Thursday",month,day,year);
        }
        else if (dayFlag == 5 || dayFlag == -5){
            NSLog (@"%d/%d/%ld is a Friday",month,day,year);
        }
        else if (dayFlag == 6 || dayFlag == -6){
            NSLog (@"%d/%d/%ld is a Saturday",month,day,year);
        }
        else
            NSLog(@"Error");
    }
    else {
        NSLog(@"Error: %d/%d/%ld does not exist",month,day,year);
    }
}


int main(int argc, const char * argv[]) {
    
    dayOfWeek(2090, 10, 29);
    return 0;
}
