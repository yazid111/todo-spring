FROM anapsix/alpine-java:8
VOLUME /tmp
#EXPOSE 8080
ADD /build/libs/todo-mysql-0.0.1-SNAPSHOT.jar app.jar

#ENTRYPOINT["java","-jar","app.jar"]
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-XX:+UnlockExperimentalVMOptions", "-XX:+UseCGroupMemoryLimitForHeap", "-XX:MaxRAMFraction=1","-jar","app.jar"]

    let monthsDays = {"1":31,"2": 28,"3": 31,"4": 30,"5":30,"6": 30,"7": 31,"8":31,"9":30,"10":31,"11":30,"12":31};
    let fromDate = ["30","12","2020","Wednsday"];

    let buildingConfig = [{"dayName": "Sunday","fromTime":"06:00a.m.","toTime":"02:00p.m."},
                          {"dayName": "Monday","fromTime":"07:00a.m.","toTime":"03:00p.m."},
                          {"dayName": "Tuesday","fromTime":"08:00a.m.","toTime":"04:00p.m."}];
    let toDate = ["3","1","2021","Tuesday"];
    
    for(let i = 0; i < 5; i ++){
      // console.log("_________",i,"_________");
      
      let currentMonth = fromDate[1];
      let dayV = parseInt(fromDate[0]);

      if( dayV < monthsDays[currentMonth]){
        this.allowedDays.push(fromDate);
        let intDay = parseInt(fromDate[0]);
        intDay ++;
        fromDate[0] = intDay.toString();
        // console.log("fromDate after increment days ",fromDate);
        
      } else if(dayV == monthsDays[currentMonth]) {
        // console.log("inside dayV == monthsDays[currentMonth]");
        // console.log(fromDate);
        
        
        this.allowedDays.push(fromDate);
        let intMonth = parseInt(fromDate[1]); 
        // console.log("intMonth", intMonth);
        
        if(intMonth < 12 ){
            intMonth ++;
            fromDate[1] = intMonth.toString();
            // console.log("fromDate in intMonth < 12",fromDate);
            
        }else if( intMonth == 12) {
            // console.log("fromDate in intMonth == 12",fromDate);
            let intYear = parseInt(fromDate[2]);
            intYear ++;
            fromDate[2] = intYear.toString();
            fromDate[0] = "1";
            fromDate[1] = "1";

        }
      }
      console.log("final fromDate", fromDate);
      
    }
  }
