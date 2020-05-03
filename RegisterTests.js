function ClearBox(Id1) {
    document.getElementById(Id1).innerHTML = "";
}

function LogClearTextBlocks() {
    document.getElementById("UserNameLog").value = "";
    document.getElementById("ZeePasswordLog").value = "";
}

function ClearTextBlocks() {
    document.getElementById("FirstName").value = "";
    document.getElementById("FNameError").innerHTML = "";
    document.getElementById("LastName").value = "";
    document.getElementById("LNameError").innerHTML = "";
    document.getElementById("ZeeUserName").value = "";
    document.getElementById("UNameError").innerHTML = "";
    document.getElementById("Password").value = "";
    document.getElementById("ConfirmedPassword").value = "";
    document.getElementById("PassError").innerHTML = "";
    document.getElementById("PassError2").innerHTML = "";
    document.getElementById("BirthDate").value = "";
    document.getElementById("BirthDateError").innerHTML = "";
    document.getElementById("Age").value = "";
    document.getElementById("AgeError").innerHTML = "";
    document.getElementById("PhoneNum").value = "";
    document.getElementById("PhoneError").innerHTML = "";
    document.getElementById("Address").value = "";
    document.getElementById("AddressError").innerHTML = "";
    document.getElementById("ZeeUsersMail").value = "";
    document.getElementById("MailError").innerHTML = "";
}

function isABCHebrewOrSpace(Word1) {
    var HebrewLetters = "אבגדהוזחטיכלמנסעפצקרשתןףךםץ "
    var range = Word1.length;
    for (var i = 0; i < range; i++) {
        var x = Word1.charAt(i);
        if (HebrewLetters.includes(x) == false) {
            return false;
        }
    }
    return true;
}

function AddressTest(Word1) {
    var allow = " אבגדהוזחטיכלמנסעפצקרשתףךץםן1234567890-"
    var range = Word1.length;
    for (var i = 0; i < range; i++) {
        var x = Word1.charAt(i);
        if (allow.includes(x) == false) {
            return false;
        }
    }
    return true;
}

function PassTest(Word1) {
    var Allowed = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_1234567890"
    var range = Word1.length;
    for (var i = 0; i < range; i++) {
        var x = Word1.charAt(i);
        if (Allowed.includes(x) == false) {
            return false;
        }
    }
    return true;
}

function MailTest(Word1) {
    var Allowed = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890.@"
    var range = Word1.length;
    for (var i = 0; i < range; i++) {

        var x = Word1.charAt(i);
        if (Allowed.includes(x) == false) {
            return false;
        }
    }
    return true;
}

function IsOnlyNums(ZeeNum) {
    var Allowed = "1234567890"
    var range = ZeeNum.length;
    for (var i = 0; i < range; i++) {
        var x = ZeeNum.charAt(i);
        if (Allowed.includes(x) == false) {
            return false;
        }
    }
    return true;
}

function FirstNameCheck() {
    var name = document.getElementById("FirstName").value;
    if (isABCHebrewOrSpace(name) == false || name == "") {
        document.getElementById("FNameError").innerHTML = "לא תקין, הכנס שם רק מאותיות מהא-ב ורווחים";
        return false;
    }
    else { return true; }
}

function UserNameCheck() {
    var name = document.getElementById("ZeeUserName").value;
    if (PassTest(name) == false || name == "") {
        document.getElementById("UNameError").innerHTML = "לא תקין,הכנס שם מאותיות באנגלית,ספרות וקו תחתון";
        return false;
    }
    else { return true; }
}

function MailCheck() {
    var Mail = document.getElementById("ZeeUsersMail").value;
    if (MailTest(Mail) == false || Mail == "") {
        document.getElementById("MailError").innerHTML = "לא תקין,הכנס מייל מאותיות באנגלית,ספרות ונקודה";
        return false;
    }
    else {
        return true;
    }
}

function LastNameCheck() {
    var name = document.getElementById("LastName").value;
    if (isABCHebrewOrSpace(name) == false || name == "") {
        document.getElementById("LNameError").innerHTML = "לא תקין, הכנס שם רק מאותיות מהא-ב ורווחים";
        return false;
    }
    else { return true; }
}

function PassCheck() {
    var pass = document.getElementById("Password").value;
    var ConfirmPass = document.getElementById("ConfirmedPassword").value;
    if (ConfirmPass != pass && (pass.length < 6 || pass.length > 10 || PassTest(pass) == false)) {
        document.getElementById("PassError2").innerHTML = "שתי הסיסמאות לא שוות";
        document.getElementById("PassError").innerHTML = "הכנס בין 6 ל10 ספרות, אותיות או קו תחתון";
        return false;
    }
    else if (ConfirmPass != pass) {
        document.getElementById("PassError2").innerHTML = "שתי הסיסמאות לא שוות";
        return false;
    }
    else if (pass.length < 6 || pass.length > 10 || PassTest(pass) == false) {
        document.getElementById("PassError").innerHTML = "הכנס בין 6 ל10 ספרות, אותיות או קו תחתון";
        return false;
    }
    else { return true; }
}

function BirthDateToAge() {
    var ZeeDate = document.getElementById("BirthDate").value;
    var Step = new Date();
    var ThisYear = Step.getFullYear();
    var ThisMonth = Step.getMonth() + 1;
    var ThisDay = Step.getDate();
    var CurrentAge;
    CurrentAge = ThisYear - (ZeeDate.slice(0, 4));
    if ((ThisMonth - ZeeDate.slice(5, 7) < 0) || (ThisMonth - ZeeDate.slice(5, 7) == 0 && ThisDay - ZeeDate.slice(8, 10) < 0)) {
        CurrentAge = CurrentAge - 1;
    }
    if (CurrentAge < 0) {
        document.getElementById("BirthDateError").innerHTML = "לא תקין, לא יכול להיות תאריך עתידי";
        document.getElementById("AgeTD").innerHTML = "<input type='number' id='Age' name='Age' disabled />";
        return false;
    }
    else {
        document.getElementById("AgeTD").innerHTML = "<input type='number' id='Age' name='Age' value=" + CurrentAge + " disabled />";
        return true;
    }
}

function BirthDateCheck() {
    var ZeeDate = document.getElementById("BirthDate").value;
    var ItsYear = ZeeDate.slice(0, 4)
    if (ItsYear < 1960) {
        document.getElementById("BirthDateError").innerHTML = "בעיה בתאריך, הכנס תאריכים רק מ1960 והלאה...";
        return false;
    }
    else { return true; }
}

function PhoneNumCheck() {
    var ZeePhoneNum = document.getElementById("PhoneNum").value;
    var firstDigit = ZeePhoneNum.charAt(0);
    var SecondDigit = ZeePhoneNum.charAt(1);
    if (ZeePhoneNum.length != 10 || IsOnlyNums(ZeePhoneNum) == false || firstDigit != 0 || SecondDigit != 5) {
        document.getElementById("PhoneError").innerHTML = " לא תקין, הכנס מספר בן 10 ספרות שמתחיל ב05";
        return false;
    }
    else { return true; }
}

function AddressCheck() {
    var ZeeAddress = document.getElementById("Address").value;
    if (AddressTest(ZeeAddress) == false || ZeeAddress == "") {
        document.getElementById("AddressError").innerHTML = " לא תקין, הכנס כתובת מאותיות, מספרים, מקף ורווח";
        return false;
    }
    else { return true; }
}

function UnUniqueUserName() {
    document.getElementById("UNameError").innerHTML = "שם משתמש זה תפוס";

}

function UnUniqueMail() {
    document.getElementById("MailError").innerHTML = "על מייל זה יש כבר חשבון";

}

function UnUniqueBoth() {
    document.getElementById("UNameError").innerHTML = "שם משתמש זה תפוס";
    document.getElementById("MailError").innerHTML = "על מייל זה יש כבר חשבון";

}

function CheckStuff() {
    FirstNameCheck();
    LastNameCheck();
    PassCheck();
    BirthDateCheck();
    PhoneNumCheck();
    BirthDateToAge();
    UserNameCheck();
    MailCheck();
    AddressCheck();

    if (FirstNameCheck() && LastNameCheck() && PassCheck() && BirthDateCheck() && PhoneNumCheck() && BirthDateToAge() && UserNameCheck() && MailCheck() && AddressCheck()) {
        return true;
    }
    else {
        return false;
    }
}


function UClearTextBlocks() {
    document.getElementById("UFirstName").value = "";
    document.getElementById("UFNameError").innerHTML = "";
    document.getElementById("ULastName").value = "";
    document.getElementById("ULNameError").innerHTML = "";
    document.getElementById("UZeeUserName").value = "";
    document.getElementById("UUNameError").innerHTML = "";
    document.getElementById("UPassword").value = "";
    document.getElementById("UConfirmedPassword").value = "";
    document.getElementById("UPassError").innerHTML = "";
    document.getElementById("UPassError2").innerHTML = "";
    document.getElementById("UBirthDate").value = "";
    document.getElementById("UBirthDateError").innerHTML = "";
    document.getElementById("UAge").value = "";
    document.getElementById("UAgeError").innerHTML = "";
    document.getElementById("UPhoneNum").value = "";
    document.getElementById("UPhoneError").innerHTML = "";
    document.getElementById("UAddress").value = "";
    document.getElementById("UAddressError").innerHTML = "";
    document.getElementById("UZeeUsersMail").value = "";
    document.getElementById("UMailError").innerHTML = "";
}

function UFirstNameCheck() {
    var name = document.getElementById("UFirstName").value;
    if (isABCHebrewOrSpace(name) == false || name == "") {
        document.getElementById("UFNameError").innerHTML = "לא תקין, הכנס שם רק מאותיות מהא-ב ורווחים";
        return false;
    }
    else { return true; }
}

function UUserNameCheck() {
    var name = document.getElementById("UZeeUserName").value;
    if (PassTest(name) == false || name == "") {
        document.getElementById("UUNameError").innerHTML = "לא תקין,הכנס שם מאותיות באנגלית,ספרות וקו תחתון";
        return false;
    }
    else { return true; }
}

function UMailCheck() {
    var Mail = document.getElementById("UZeeUsersMail").value;
    if (MailTest(Mail) == false || Mail == "") {
        document.getElementById("UMailError").innerHTML = "לא תקין,הכנס מייל מאותיות באנגלית,ספרות ונקודה";
        return false;
    }
    else {
        return true;
    }
}

function ULastNameCheck() {
    var name = document.getElementById("ULastName").value;
    if (isABCHebrewOrSpace(name) == false || name == "") {
        document.getElementById("ULNameError").innerHTML = "לא תקין, הכנס שם רק מאותיות מהא-ב ורווחים";
        return false;
    }
    else { return true; }
}

function UPassCheck() {
    var pass = document.getElementById("UPassword").value;
    var ConfirmPass = document.getElementById("UConfirmedPassword").value;
    if (ConfirmPass != pass && (pass.length < 6 || pass.length > 10 || PassTest(pass) == false)) {
        document.getElementById("UPassError2").innerHTML = "שתי הסיסמאות לא שוות";
        document.getElementById("UPassError").innerHTML = "הכנס בין 6 ל10 ספרות, אותיות או קו תחתון";
        return false;
    }
    else if (ConfirmPass != pass) {
        document.getElementById("UPassError2").innerHTML = "שתי הסיסמאות לא שוות";
        return false;
    }
    else if (pass.length < 6 || pass.length > 10 || PassTest(pass) == false) {
        document.getElementById("UPassError").innerHTML = "הכנס בין 6 ל10 ספרות, אותיות או קו תחתון";
        return false;
    }
    else { return true; }
}

function UBirthDateToAge() {
    var ZeeDate = document.getElementById("UBirthDate").value;
    var Step = new Date();
    var ThisYear = Step.getFullYear();
    var ThisMonth = Step.getMonth() + 1;
    var ThisDay = Step.getDate();
    var CurrentAge;
    CurrentAge = ThisYear - (ZeeDate.slice(0, 4));
    if ((ThisMonth - ZeeDate.slice(5, 7) < 0) || (ThisMonth - ZeeDate.slice(5, 7) == 0 && ThisDay - ZeeDate.slice(8, 10) < 0)) {
        CurrentAge = CurrentAge - 1;
    }
    if (CurrentAge < 0) {
        document.getElementById("UBirthDateError").innerHTML = "לא תקין, לא יכול להיות תאריך עתידי";
        document.getElementById("UAgeTD").innerHTML = "<input type='number' id='Age' name='Age' disabled />";
        return false;
    }
    else {
        document.getElementById("UAgeTD").innerHTML = "<input type='number' id='Age' name='Age' value=" + CurrentAge + " disabled />";
        return true;
    }
}

function UBirthDateCheck() {
    var ZeeDate = document.getElementById("UBirthDate").value;
    var ItsYear = ZeeDate.slice(0, 4)
    if (ItsYear < 1960) {
        document.getElementById("UBirthDateError").innerHTML = "בעיה בתאריך, הכנס תאריכים רק מ1960 והלאה...";
        return false;
    }
    else { return true; }
}

function UPhoneNumCheck() {
    var ZeePhoneNum = document.getElementById("UPhoneNum").value;
    var firstDigit = ZeePhoneNum.charAt(0);
    var SecondDigit = ZeePhoneNum.charAt(1);
    if (ZeePhoneNum.length != 10 || IsOnlyNums(ZeePhoneNum) == false || firstDigit != 0 || SecondDigit != 5) {
        document.getElementById("UPhoneError").innerHTML = " לא תקין, הכנס מספר בן 10 ספרות שמתחיל ב05";
        return false;
    }
    else { return true; }
}

function UAddressCheck() {
    var ZeeAddress = document.getElementById("UAddress").value;
    if (AddressTest(ZeeAddress) == false || ZeeAddress == "") {
        document.getElementById("UAddressError").innerHTML = " לא תקין, הכנס כתובת מאותיות, מספרים, מקף ורווח";
        return false;
    }
    else { return true; }
}


function UCheckStuff() {
    UFirstNameCheck();
    ULastNameCheck();
    UPassCheck();
    UBirthDateCheck();
    UPhoneNumCheck();
    UBirthDateToAge();
    UUserNameCheck();
    UMailCheck();
    UAddressCheck();

    if (UFirstNameCheck() && ULastNameCheck() && UPassCheck() && UBirthDateCheck() && UPhoneNumCheck() && UBirthDateToAge() && UUserNameCheck() && UMailCheck() && UAddressCheck()) {
        return true;
    }
    else {
        return false;
    }
}
