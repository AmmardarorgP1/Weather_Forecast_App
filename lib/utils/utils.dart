import 'package:intl/intl.dart';


class Utils
{

  static String appId = "42f09fb9b1d91f1b24e597e99f324549";


  static String getFormattedDate(DateTime dateTime)
  {
  
    return DateFormat("EEEE, MMM d, y").format(dateTime);

  }

}

