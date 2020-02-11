FROM anapsix/alpine-java:8
VOLUME /tmp
#EXPOSE 8080
ADD /build/libs/todo-mysql-0.0.1-SNAPSHOT.jar app.jar

#ENTRYPOINT["java","-jar","app.jar"]
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-XX:+UnlockExperimentalVMOptions", "-XX:+UseCGroupMemoryLimitForHeap", "-XX:MaxRAMFraction=1","-jar","app.jar"]

  counter(){
    const internalAllowedDays = [];
    let iAllowdDaysObjects =[];
    let monthsDays = {"1":31,"2": 28,"3": 31,"4": 30,"5":30,"6": 30,"7": 31,"8":31,"9":30,"10":31,"11":30,"12":31};
    var fromDate = ["30","12","2020","Wednsday"];
    var fromDateObj = {"day":30,
    "month":12,"year":2020,"dayname":"Wednsday"};

    let buildingConfig = [{"dayName": "Sunday","fromTime":"06:00a.m.","toTime":"02:00p.m."},
                          {"dayName": "Monday","fromTime":"07:00a.m.","toTime":"03:00p.m."},
                          {"dayName": "Tuesday","fromTime":"08:00a.m.","toTime":"04:00p.m."}];
    let toDate;//["3","1","2021","Tuesday"];
    
    for(let i = 0; i < 5; i ++){
      console.log("_________",i,"_________");
      toDate = fromDate;
      let currentMonth = fromDate[1];
      let dayV = parseInt(fromDate[0]);

      if( dayV < monthsDays[currentMonth]){
        this.allowedDays.push(fromDate);
        internalAllowedDays.push(toDate);
        console.log("internalAllowedDays after first push-->",internalAllowedDays);

        let intDay = parseInt(fromDate[0]);
        intDay ++;
        fromDate[0] = intDay.toString();
        console.log("fromDate after increment days ",fromDate);
        
      } else if(dayV == monthsDays[currentMonth]) {
        console.log("inside dayV == monthsDays[currentMonth]");
        console.log(fromDate);
        
        
        this.allowedDays.push(fromDate);
        internalAllowedDays.push(toDate);
        let intMonth = parseInt(fromDate[1]); 
        console.log("intMonth", intMonth);
        
        if(intMonth < 12 ){
            intMonth ++;
            fromDate[1] = intMonth.toString();
            console.log("fromDate in intMonth < 12",fromDate);
            
        }else if( intMonth == 12) {
            console.log("fromDate in intMonth == 12",fromDate);
            let intYear = parseInt(fromDate[2]);
            intYear ++;
            fromDate[2] = intYear.toString();
            fromDate[0] = "1";
            fromDate[1] = "1";

        }
      }
      console.log("final allowedDays", this.allowedDays);
      console.log("internalAllowedDays-->",internalAllowedDays);
      
      
    }


    for(let i = 0; i < 5; i ++){
      var newObj = {};
      console.log("_________",i,"_________");
      
      let currentMonth = fromDateObj.month;
      console.log("currentMonth",currentMonth);
      
      let dayV = parseInt(fromDate[0]);

      if( fromDateObj.day < monthsDays[currentMonth]) {
        // {"day":30,"month":12,"year":2020,"dayname":"Wednsday"};
        newObj["day"]= fromDateObj.day;
        newObj["month"] = fromDateObj.month;
        newObj["year"] = fromDateObj.year;
        newObj["dayname"] = fromDateObj.dayname
        iAllowdDaysObjects.push(newObj);
 
        fromDateObj.day = fromDateObj.day +1;
        // console.log("fromDateObj after increment days ",fromDateObj);
        
      } else if(fromDateObj.day == monthsDays[currentMonth]) {

        // console.log("inside fromDateObj.day == monthsDays[currentMonth]");
        // console.log(fromDateObj);
        newObj["day"]= fromDateObj.day;
        newObj["month"] = fromDateObj.month;
        newObj["year"] = fromDateObj.year;
        newObj["dayname"] = fromDateObj.dayname
        iAllowdDaysObjects.push(newObj);
        // fromDateObj.month ++;

        // console.log("fromDateObj.month", fromDateObj.month);
        
        if(fromDateObj.month < 12 ){
          fromDateObj.month ++;
            // fromDate[1] = intMonth.toString();
            // console.log("fromDate in intMonth < 12",fromDateObj);
            
        }else if(fromDateObj.month == 12) {
            // console.log("fromDateObj in intMonth == 12",fromDateObj);
            fromDateObj.year ++;
            fromDateObj.day = 1;
            fromDateObj.month = 1;
        }
      }
      console.log("iAllowdDaysObjects-->",iAllowdDaysObjects);
      // console.log("obAllowedDay --_-->",this.obAllowedDay);
      
    }
  }
