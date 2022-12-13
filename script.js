const date = document.getElementById("date");
const month = document.getElementById("month");
const year = document.getElementById("year");
const getDay = document.getElementById("getDay");
const result = document.getElementById("result");

getDay.addEventListener("click", () => {
    let da = new Date(`${date.value} ${month.value} ${year.value}`);
    
    let Day = da.toString();
    Day = Day.slice(0, 3);
    
    switch(Day){
        case "Sun":{
            Day = "SUNDAY";
            break;}
        case "Mon":{
            Day = "MONDAY";
            break;}
        case "Tue":{
            Day = "TUSDAY";
            break;}
        case "Wed":{
            Day = "WEDNSDAY";
            break;}
        case "Thu":{
            Day = "THURSDAY";
            break;}
        case "Fri":{
            Day = "FRIDAY";
            break;}
        case "Sat":{
            Day = "SATERDAY";
            break;}
    }
    result.innerText = Day;
})