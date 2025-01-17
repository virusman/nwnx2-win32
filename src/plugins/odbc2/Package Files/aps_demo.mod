MOD V1.0   F      �   �   �  i       ����                                                                                                                        >   This module shows how you can use APS/NWNX in your own module.aps_include         �  aps_onload         �  aps_onload         �  area001            �  area001            �  area001            �  creaturepalcus     �  demo_createtable   �  demo_createtable   �  demo_loadvalue  	   �  demo_loadvalue  
   �  demo_obj_create    �  demo_obj_create    �  demo_obj_loadval   �  demo_obj_loadval   �  demo_obj_storval   �  demo_obj_storval   �  demo_storevalue    �  demo_storevalue    �  doorpalcus         �  encounterpalcus    �  itempalcus         �  placeablepalcus    �  Repute             �  soundpalcus        �  storepalcus        �  triggerpalcus      �  waypointpalcus     �  module             �  �  �V  <[  /  k\  t  �]  i2  H�  0  x�  (E  ��  �  ��    ��  f  �  �  ��  �  ��  !  ��  �  � �  a �  � l  V �   q  ~ �  ( �  �! �  |$ l  �3 �  �8 a  E@ �  C �  E l  qH �  YJ M  // Name     : Avlis Persistence System include
// Purpose  : Various APS/NWNX2 related functions
// Authors  : Ingmar Stieger, Adam Colon, Josh Simon
// Modified : January 1st, 2005

// This file is licensed under the terms of the
// GNU GENERAL PUBLIC LICENSE (GPL) Version 2

/************************************/
/* Return codes                     */
/************************************/

const int SQL_ERROR = 0;
const int SQL_SUCCESS = 1;

/************************************/
/* Function prototypes              */
/************************************/

// Setup placeholders for ODBC requests and responses
void SQLInit();

// Execute statement in sSQL
void SQLExecDirect(string sSQL);

// Position cursor on next row of the resultset
// Call this before using SQLGetData().
// returns: SQL_SUCCESS if there is a row
//          SQL_ERROR if there are no more rows
int SQLFetch();

// * deprecated. Use SQLFetch instead.
// Position cursor on first row of the resultset and name it sResultSetName
// Call this before using SQLNextRow() and SQLGetData().
// returns: SQL_SUCCESS if result set is not empty
//          SQL_ERROR is result set is empty
int SQLFirstRow();

// * deprecated. Use SQLFetch instead.
// Position cursor on next row of the result set sResultSetName
// returns: SQL_SUCCESS if cursor could be advanced to next row
//          SQL_ERROR if there was no next row
int SQLNextRow();

// Return value of column iCol in the current row of result set sResultSetName
string SQLGetData(int iCol);

// Return a string value when given a location
string APSLocationToString(location lLocation);

// Return a location value when given the string form of the location
location APSStringToLocation(string sLocation);

// Return a string value when given a vector
string APSVectorToString(vector vVector);

// Return a vector value when given the string form of the vector
vector APSStringToVector(string sVector);

// Set oObject's persistent string variable sVarName to sValue
// Optional parameters:
//   iExpiration: Number of days the persistent variable should be kept in database (default: 0=forever)
//   sTable: Name of the table where variable should be stored (default: pwdata)
void SetPersistentString(object oObject, string sVarName, string sValue, int iExpiration =
                         0, string sTable = "pwdata");

// Set oObject's persistent integer variable sVarName to iValue
// Optional parameters:
//   iExpiration: Number of days the persistent variable should be kept in database (default: 0=forever)
//   sTable: Name of the table where variable should be stored (default: pwdata)
void SetPersistentInt(object oObject, string sVarName, int iValue, int iExpiration =
                      0, string sTable = "pwdata");

// Set oObject's persistent float variable sVarName to fValue
// Optional parameters:
//   iExpiration: Number of days the persistent variable should be kept in database (default: 0=forever)
//   sTable: Name of the table where variable should be stored (default: pwdata)
void SetPersistentFloat(object oObject, string sVarName, float fValue, int iExpiration =
                        0, string sTable = "pwdata");

// Set oObject's persistent location variable sVarName to lLocation
// Optional parameters:
//   iExpiration: Number of days the persistent variable should be kept in database (default: 0=forever)
//   sTable: Name of the table where variable should be stored (default: pwdata)
//   This function converts location to a string for storage in the database.
void SetPersistentLocation(object oObject, string sVarName, location lLocation, int iExpiration =
                           0, string sTable = "pwdata");

// Set oObject's persistent vector variable sVarName to vVector
// Optional parameters:
//   iExpiration: Number of days the persistent variable should be kept in database (default: 0=forever)
//   sTable: Name of the table where variable should be stored (default: pwdata)
//   This function converts vector to a string for storage in the database.
void SetPersistentVector(object oObject, string sVarName, vector vVector, int iExpiration =
                         0, string sTable = "pwdata");

// Set oObject's persistent object with sVarName to sValue
// Optional parameters:
//   iExpiration: Number of days the persistent variable should be kept in database (default: 0=forever)
//   sTable: Name of the table where variable should be stored (default: pwobjdata)
void SetPersistentObject(object oObject, string sVarName, object oObject2, int iExpiration =
                         0, string sTable = "pwobjdata");

// Get oObject's persistent string variable sVarName
// Optional parameters:
//   sTable: Name of the table where variable is stored (default: pwdata)
// * Return value on error: ""
string GetPersistentString(object oObject, string sVarName, string sTable = "pwdata");

// Get oObject's persistent integer variable sVarName
// Optional parameters:
//   sTable: Name of the table where variable is stored (default: pwdata)
// * Return value on error: 0
int GetPersistentInt(object oObject, string sVarName, string sTable = "pwdata");

// Get oObject's persistent float variable sVarName
// Optional parameters:
//   sTable: Name of the table where variable is stored (default: pwdata)
// * Return value on error: 0
float GetPersistentFloat(object oObject, string sVarName, string sTable = "pwdata");

// Get oObject's persistent location variable sVarName
// Optional parameters:
//   sTable: Name of the table where variable is stored (default: pwdata)
// * Return value on error: 0
location GetPersistentLocation(object oObject, string sVarname, string sTable = "pwdata");

// Get oObject's persistent vector variable sVarName
// Optional parameters:
//   sTable: Name of the table where variable is stored (default: pwdata)
// * Return value on error: 0
vector GetPersistentVector(object oObject, string sVarName, string sTable = "pwdata");

// Get oObject's persistent object sVarName
// Optional parameters:
//   sTable: Name of the table where object is stored (default: pwobjdata)
// * Return value on error: 0
object GetPersistentObject(object oObject, string sVarName, object oOwner = OBJECT_INVALID, string sTable = "pwobjdata");

// Delete persistent variable sVarName stored on oObject
// Optional parameters:
//   sTable: Name of the table where variable is stored (default: pwdata)
void DeletePersistentVariable(object oObject, string sVarName, string sTable = "pwdata");

// (private function) Replace special character ' with ~
string SQLEncodeSpecialChars(string sString);

// (private function)Replace special character ' with ~
string SQLDecodeSpecialChars(string sString);

/************************************/
/* Implementation                   */
/************************************/

// Functions for initializing APS and working with result sets

void SQLInit()
{
    int i;

    // Placeholder for ODBC persistence
    string sMemory;

    for (i = 0; i < 8; i++)     // reserve 8*128 bytes
        sMemory +=
            "................................................................................................................................";

    SetLocalString(GetModule(), "NWNX!ODBC!SPACER", sMemory);
}

void SQLExecDirect(string sSQL)
{
    SetLocalString(GetModule(), "NWNX!ODBC!EXEC", sSQL);
}

int SQLFetch()
{
    string sRow;
    object oModule = GetModule();

    SetLocalString(oModule, "NWNX!ODBC!FETCH", GetLocalString(oModule, "NWNX!ODBC!SPACER"));
    sRow = GetLocalString(oModule, "NWNX!ODBC!FETCH");
    if (GetStringLength(sRow) > 0)
    {
        SetLocalString(oModule, "NWNX_ODBC_CurrentRow", sRow);
        return SQL_SUCCESS;
    }
    else
    {
        SetLocalString(oModule, "NWNX_ODBC_CurrentRow", "");
        return SQL_ERROR;
    }
}

// deprecated. use SQLFetch().
int SQLFirstRow()
{
    return SQLFetch();
}

// deprecated. use SQLFetch().
int SQLNextRow()
{
    return SQLFetch();
}

string SQLGetData(int iCol)
{
    int iPos;
    string sResultSet = GetLocalString(GetModule(), "NWNX_ODBC_CurrentRow");

    // find column in current row
    int iCount = 0;
    string sColValue = "";

    iPos = FindSubString(sResultSet, "�");
    if ((iPos == -1) && (iCol == 1))
    {
        // only one column, return value immediately
        sColValue = sResultSet;
    }
    else if (iPos == -1)
    {
        // only one column but requested column > 1
        sColValue = "";
    }
    else
    {
        // loop through columns until found
        while (iCount != iCol)
        {
            iCount++;
            if (iCount == iCol)
                sColValue = GetStringLeft(sResultSet, iPos);
            else
            {
                sResultSet = GetStringRight(sResultSet, GetStringLength(sResultSet) - iPos - 1);
                iPos = FindSubString(sResultSet, "�");
            }

            // special case: last column in row
            if (iPos == -1)
                iPos = GetStringLength(sResultSet);
        }
    }

    return sColValue;
}

// These functions deal with various data types. Ultimately, all information
// must be stored in the database as strings, and converted back to the proper
// form when retrieved.

string APSVectorToString(vector vVector)
{
    return "#POSITION_X#" + FloatToString(vVector.x) + "#POSITION_Y#" + FloatToString(vVector.y) +
        "#POSITION_Z#" + FloatToString(vVector.z) + "#END#";
}

vector APSStringToVector(string sVector)
{
    float fX, fY, fZ;
    int iPos, iCount;
    int iLen = GetStringLength(sVector);

    if (iLen > 0)
    {
        iPos = FindSubString(sVector, "#POSITION_X#") + 12;
        iCount = FindSubString(GetSubString(sVector, iPos, iLen - iPos), "#");
        fX = StringToFloat(GetSubString(sVector, iPos, iCount));

        iPos = FindSubString(sVector, "#POSITION_Y#") + 12;
        iCount = FindSubString(GetSubString(sVector, iPos, iLen - iPos), "#");
        fY = StringToFloat(GetSubString(sVector, iPos, iCount));

        iPos = FindSubString(sVector, "#POSITION_Z#") + 12;
        iCount = FindSubString(GetSubString(sVector, iPos, iLen - iPos), "#");
        fZ = StringToFloat(GetSubString(sVector, iPos, iCount));
    }

    return Vector(fX, fY, fZ);
}

string APSLocationToString(location lLocation)
{
    object oArea = GetAreaFromLocation(lLocation);
    vector vPosition = GetPositionFromLocation(lLocation);
    float fOrientation = GetFacingFromLocation(lLocation);
    string sReturnValue;

    if (GetIsObjectValid(oArea))
        sReturnValue =
            "#AREA#" + GetTag(oArea) + "#POSITION_X#" + FloatToString(vPosition.x) +
            "#POSITION_Y#" + FloatToString(vPosition.y) + "#POSITION_Z#" +
            FloatToString(vPosition.z) + "#ORIENTATION#" + FloatToString(fOrientation) + "#END#";

    return sReturnValue;
}

location APSStringToLocation(string sLocation)
{
    location lReturnValue;
    object oArea;
    vector vPosition;
    float fOrientation, fX, fY, fZ;

    int iPos, iCount;
    int iLen = GetStringLength(sLocation);

    if (iLen > 0)
    {
        iPos = FindSubString(sLocation, "#AREA#") + 6;
        iCount = FindSubString(GetSubString(sLocation, iPos, iLen - iPos), "#");
        oArea = GetObjectByTag(GetSubString(sLocation, iPos, iCount));

        iPos = FindSubString(sLocation, "#POSITION_X#") + 12;
        iCount = FindSubString(GetSubString(sLocation, iPos, iLen - iPos), "#");
        fX = StringToFloat(GetSubString(sLocation, iPos, iCount));

        iPos = FindSubString(sLocation, "#POSITION_Y#") + 12;
        iCount = FindSubString(GetSubString(sLocation, iPos, iLen - iPos), "#");
        fY = StringToFloat(GetSubString(sLocation, iPos, iCount));

        iPos = FindSubString(sLocation, "#POSITION_Z#") + 12;
        iCount = FindSubString(GetSubString(sLocation, iPos, iLen - iPos), "#");
        fZ = StringToFloat(GetSubString(sLocation, iPos, iCount));

        vPosition = Vector(fX, fY, fZ);

        iPos = FindSubString(sLocation, "#ORIENTATION#") + 13;
        iCount = FindSubString(GetSubString(sLocation, iPos, iLen - iPos), "#");
        fOrientation = StringToFloat(GetSubString(sLocation, iPos, iCount));

        lReturnValue = Location(oArea, vPosition, fOrientation);
    }

    return lReturnValue;
}

// These functions are responsible for transporting the various data types back
// and forth to the database.

void SetPersistentString(object oObject, string sVarName, string sValue, int iExpiration =
                         0, string sTable = "pwdata")
{
    string sPlayer;
    string sTag;

    if (GetIsPC(oObject))
    {
        sPlayer = SQLEncodeSpecialChars(GetPCPlayerName(oObject));
        sTag = SQLEncodeSpecialChars(GetName(oObject));
    }
    else
    {
        sPlayer = "~";
        sTag = GetTag(oObject);
    }

    sVarName = SQLEncodeSpecialChars(sVarName);
    sValue = SQLEncodeSpecialChars(sValue);

    string sSQL = "SELECT player FROM " + sTable + " WHERE player='" + sPlayer +
        "' AND tag='" + sTag + "' AND name='" + sVarName + "'";
    SQLExecDirect(sSQL);

    if (SQLFetch() == SQL_SUCCESS)
    {
        // row exists
        sSQL = "UPDATE " + sTable + " SET val='" + sValue +
            "',expire=" + IntToString(iExpiration) + " WHERE player='" + sPlayer +
            "' AND tag='" + sTag + "' AND name='" + sVarName + "'";
        SQLExecDirect(sSQL);
    }
    else
    {
        // row doesn't exist
        sSQL = "INSERT INTO " + sTable + " (player,tag,name,val,expire) VALUES" +
            "('" + sPlayer + "','" + sTag + "','" + sVarName + "','" +
            sValue + "'," + IntToString(iExpiration) + ")";
        SQLExecDirect(sSQL);
    }
}

string GetPersistentString(object oObject, string sVarName, string sTable = "pwdata")
{
    string sPlayer;
    string sTag;

    if (GetIsPC(oObject))
    {
        sPlayer = SQLEncodeSpecialChars(GetPCPlayerName(oObject));
        sTag = SQLEncodeSpecialChars(GetName(oObject));
    }
    else
    {
        sPlayer = "~";
        sTag = GetTag(oObject);
    }

    sVarName = SQLEncodeSpecialChars(sVarName);

    string sSQL = "SELECT val FROM " + sTable + " WHERE player='" + sPlayer +
        "' AND tag='" + sTag + "' AND name='" + sVarName + "'";
    SQLExecDirect(sSQL);

    if (SQLFetch() == SQL_SUCCESS)
        return SQLDecodeSpecialChars(SQLGetData(1));
    else
    {
        return "";
        // If you want to convert your existing persistent data to APS, this
        // would be the place to do it. The requested variable was not found
        // in the database, you should
        // 1) query it's value using your existing persistence functions
        // 2) save the value to the database using SetPersistentString()
        // 3) return the string value here.
    }
}

void SetPersistentInt(object oObject, string sVarName, int iValue, int iExpiration =
                      0, string sTable = "pwdata")
{
    SetPersistentString(oObject, sVarName, IntToString(iValue), iExpiration, sTable);
}

int GetPersistentInt(object oObject, string sVarName, string sTable = "pwdata")
{
    string sPlayer;
    string sTag;
    object oModule;

    if (GetIsPC(oObject))
    {
        sPlayer = SQLEncodeSpecialChars(GetPCPlayerName(oObject));
        sTag = SQLEncodeSpecialChars(GetName(oObject));
    }
    else
    {
        sPlayer = "~";
        sTag = GetTag(oObject);
    }

    sVarName = SQLEncodeSpecialChars(sVarName);

    string sSQL = "SELECT val FROM " + sTable + " WHERE player='" + sPlayer +
        "' AND tag='" + sTag + "' AND name='" + sVarName + "'";
    SQLExecDirect(sSQL);

    oModule = GetModule();
    SetLocalString(oModule, "NWNX!ODBC!FETCH", "-2147483647");
    return StringToInt(GetLocalString(oModule, "NWNX!ODBC!FETCH"));
}

void SetPersistentFloat(object oObject, string sVarName, float fValue, int iExpiration =
                        0, string sTable = "pwdata")
{
    SetPersistentString(oObject, sVarName, FloatToString(fValue), iExpiration, sTable);
}

float GetPersistentFloat(object oObject, string sVarName, string sTable = "pwdata")
{
    string sPlayer;
    string sTag;
    object oModule;

    if (GetIsPC(oObject))
    {
        sPlayer = SQLEncodeSpecialChars(GetPCPlayerName(oObject));
        sTag = SQLEncodeSpecialChars(GetName(oObject));
    }
    else
    {
        sPlayer = "~";
        sTag = GetTag(oObject);
    }

    sVarName = SQLEncodeSpecialChars(sVarName);

    string sSQL = "SELECT val FROM " + sTable + " WHERE player='" + sPlayer +
        "' AND tag='" + sTag + "' AND name='" + sVarName + "'";
    SQLExecDirect(sSQL);

    oModule = GetModule();
    SetLocalString(oModule, "NWNX!ODBC!FETCH", "-340282306073709650000000000000000000000.000000000");
    return StringToFloat(GetLocalString(oModule, "NWNX!ODBC!FETCH"));
}

void SetPersistentLocation(object oObject, string sVarName, location lLocation, int iExpiration =
                           0, string sTable = "pwdata")
{
    SetPersistentString(oObject, sVarName, APSLocationToString(lLocation), iExpiration, sTable);
}

location GetPersistentLocation(object oObject, string sVarName, string sTable = "pwdata")
{
    return APSStringToLocation(GetPersistentString(oObject, sVarName, sTable));
}

void SetPersistentVector(object oObject, string sVarName, vector vVector, int iExpiration =
                         0, string sTable = "pwdata")
{
    SetPersistentString(oObject, sVarName, APSVectorToString(vVector), iExpiration, sTable);
}

vector GetPersistentVector(object oObject, string sVarName, string sTable = "pwdata")
{
    return APSStringToVector(GetPersistentString(oObject, sVarName, sTable));
}

void SetPersistentObject(object oOwner, string sVarName, object oObject, int iExpiration =
                         0, string sTable = "pwobjdata")
{
    string sPlayer;
    string sTag;

    if (GetIsPC(oOwner))
    {
        sPlayer = SQLEncodeSpecialChars(GetPCPlayerName(oOwner));
        sTag = SQLEncodeSpecialChars(GetName(oOwner));
    }
    else
    {
        sPlayer = "~";
        sTag = GetTag(oOwner);
    }
    sVarName = SQLEncodeSpecialChars(sVarName);

    string sSQL = "SELECT player FROM " + sTable + " WHERE player='" + sPlayer +
        "' AND tag='" + sTag + "' AND name='" + sVarName + "'";
    SQLExecDirect(sSQL);

    if (SQLFetch() == SQL_SUCCESS)
    {
        // row exists
        sSQL = "UPDATE " + sTable + " SET val=%s,expire=" + IntToString(iExpiration) +
            " WHERE player='" + sPlayer + "' AND tag='" + sTag + "' AND name='" + sVarName + "'";
        SetLocalString(GetModule(), "NWNX!ODBC!SETSCORCOSQL", sSQL);
        StoreCampaignObject ("NWNX", "-", oObject);
    }
    else
    {
        // row doesn't exist
        sSQL = "INSERT INTO " + sTable + " (player,tag,name,val,expire) VALUES" +
            "('" + sPlayer + "','" + sTag + "','" + sVarName + "',%s," + IntToString(iExpiration) + ")";
        SetLocalString(GetModule(), "NWNX!ODBC!SETSCORCOSQL", sSQL);
        StoreCampaignObject ("NWNX", "-", oObject);
    }
}

object GetPersistentObject(object oObject, string sVarName, object oOwner = OBJECT_INVALID, string sTable = "pwobjdata")
{
    string sPlayer;
    string sTag;
    object oModule;

    if (GetIsPC(oObject))
    {
        sPlayer = SQLEncodeSpecialChars(GetPCPlayerName(oObject));
        sTag = SQLEncodeSpecialChars(GetName(oObject));
    }
    else
    {
        sPlayer = "~";
        sTag = GetTag(oObject);
    }
    sVarName = SQLEncodeSpecialChars(sVarName);

    string sSQL = "SELECT val FROM " + sTable + " WHERE player='" + sPlayer +
        "' AND tag='" + sTag + "' AND name='" + sVarName + "'";
    SetLocalString(GetModule(), "NWNX!ODBC!SETSCORCOSQL", sSQL);

    if (!GetIsObjectValid(oOwner))
        oOwner = oObject;
    return RetrieveCampaignObject ("NWNX", "-", GetLocation(oOwner), oOwner);
}

void DeletePersistentVariable(object oObject, string sVarName, string sTable = "pwdata")
{
    string sPlayer;
    string sTag;

    if (GetIsPC(oObject))
    {
        sPlayer = SQLEncodeSpecialChars(GetPCPlayerName(oObject));
        sTag = SQLEncodeSpecialChars(GetName(oObject));
    }
    else
    {
        sPlayer = "~";
        sTag = GetTag(oObject);
    }

    sVarName = SQLEncodeSpecialChars(sVarName);
    string sSQL = "DELETE FROM " + sTable + " WHERE player='" + sPlayer +
        "' AND tag='" + sTag + "' AND name='" + sVarName + "'";
    SQLExecDirect(sSQL);
}

// Problems can arise with SQL commands if variables or values have single quotes
// in their names. These functions are a replace these quote with the tilde character

string SQLEncodeSpecialChars(string sString)
{
    if (FindSubString(sString, "'") == -1)      // not found
        return sString;

    int i;
    string sReturn = "";
    string sChar;

    // Loop over every character and replace special characters
    for (i = 0; i < GetStringLength(sString); i++)
    {
        sChar = GetSubString(sString, i, 1);
        if (sChar == "'")
            sReturn += "~";
        else
            sReturn += sChar;
    }
    return sReturn;
}

string SQLDecodeSpecialChars(string sString)
{
    if (FindSubString(sString, "~") == -1)      // not found
        return sString;

    int i;
    string sReturn = "";
    string sChar;

    // Loop over every character and replace special characters
    for (i = 0; i < GetStringLength(sString); i++)
    {
        sChar = GetSubString(sString, i, 1);
        if (sChar == "~")
            sReturn += "'";
        else
            sReturn += sChar;
    }
    return sReturn;
}


NCS V1.0B  /                ����  ��������         �����  �................................................................................................................................#����  �������� $���� ���� ���:����  NWNX!ODBC!SPACER  �   9 ����  // Name     : Avlis Persistence System OnModuleLoad
// Purpose  : Initialize APS on module load event
// Authors  : Ingmar Stieger
// Modified : January 27, 2003

// This file is licensed under the terms of the
// GNU GENERAL PUBLIC LICENSE (GPL) Version 2

#include "aps_include"

void main()
{
    // Init placeholders for ODBC gateway
    SQLInit();
}

ARE V3.28   A   D  �  <#  4   |&  =   �&  �
  a1    ����    *      �   
      �   
      �   
         
      H  
      p  
      �  
      �  
      �  
        
      8  
      `  
      �  
      �  
      �  
         
      (  
      P  
      x  
      �  
      �  
      �  
        
      @  
      h  
      �  
      �  
      �  
        
      0  
      X  
      �  
      �  
      �  
      �  
         
      H  
      p  
      �  
      �  
      �  
        
      8  
      `  
      �  
      �  
      �  
         
      (  
      P  
      x  
      �  
      �  
      �  
      	  
      @	  
      h	  
      �	  
      �	  
      �	  
      
  
      0
  
      X
  
      �
  
          ����      ����         
                         '   
      /                         	          
                       dd�                  22d                 22d       ���                  h~�                                        2           4B                                                                                      !          "         #         $   3      %   4      &   5      '   6      (   7      )         *         +          ,           -           .           /           0           1          2          3         *         +         ,           -           .           /           0           1          2          3         *         +          ,           -           .           /           0           1          2          3         *         +         ,           -           .           /           0           1          2          3         *         +         ,           -           .           /           0           1          2          3         *         +         ,           -           .           /           0           1          2          3         *         +          ,           -           .           /           0           1          2          3         *         +         ,           -           .           /           0           1          2          3         *         +         ,           -           .           /           0           1          2          3         *         +         ,           -           .           /           0           1          2          3         *         +         ,           -           .           /           0           1          2          3         *         +         ,           -           .           /           0           1          2          3         *         +         ,           -           .           /           0           1          2          3         *         +         ,           -           .           /           0           1          2          3         *         +          ,           -           .           /           0           1          2          3         *         +         ,           -           .           /           0           1          2          3         *         +         ,           -           .           /           0           1          2          3         *         +         ,           -           .           /           0           1          2          3         *         +         ,           -           .           /           0           1          2          3         *         +          ,           -           .           /           0           1          2          3         *         +         ,           -           .           /           0           1          2          3         *         +         ,           -           .           /           0           1          2          3         *         +         ,           -           .           /           0           1          2          3         *         +         ,           -           .           /           0           1          2          3         *         +         ,           -           .           /           0           1          2          3         *         +         ,           -           .           /           0           1          2          3         *         +         ,           -           .           /           0           1          2          3         *         +         ,           -           .           /           0           1          2          3         *         +         ,           -           .           /           0           1          2          3         *         +          ,           -           .           /           0           1          2          3         *         +          ,           -           .           /           0           1          2          3         *         +          ,           -           .           /           0           1          2          3         *         +         ,           -           .           /           0           1          2          3         *         +         ,           -           .           /           0           1          2          3         *         +          ,           -           .           /           0           1          2          3         *         +         ,           -           .           /           0           1          2          3         *         +         ,           -           .           /           0           1          2          3         *         +         ,           -           .           /           0           1          2          3         *         +          ,           -           .           /           0           1          2          3         *         +          ,           -           .           /           0           1          2          3         *         +          ,           -           .           /           0           1          2          3         *         +         ,           -           .           /           0           1          2          3         *         +         ,           -           .           /           0           1          2          3         *         +         ,           -           .           /           0           1          2          3         *         +         ,           -           .           /           0           1          2          3         *         +         ,           -           .           /           0           1          2          3         *         +         ,           -           .           /           0           1          2          3         *         +         ,           -           .           /           0           1          2          3         *         +          ,           -           .           /           0           1          2          3         *         +         ,           -           .           /           0           1          2          3         *         +         ,           -           .           /           0           1          2          3         *         +         ,           -           .           /           0           1          2          3         *         +          ,           -           .           /           0           1          2          3         *         +         ,           -           .           /           0           1          2          3         *         +          ,           -           .           /           0           1          2          3         *         +          ,           -           .           /           0           1          2          3         *         +         ,           -           .           /           0           1          2          3         *         +         ,           -           .           /           0           1          2          3         *         +          ,           -           .           /           0           1          2          3         *         +          ,           -           .           /           0           1          2          3         *         +          ,           -           .           /           0           1          2          3         *         +         ,           -           .           /           0           1          2          3         *         +          ,           -           .           /           0           1          2          3         *         +         ,           -           .           /           0           1          2          3      ID              Creator_ID      Version         Tag             Name            ResRef          Comments        Expansion_List  Flags           ModSpotCheck    ModListenCheck  MoonAmbientColorMoonDiffuseColorMoonFogAmount   MoonFogColor    MoonShadows     SunAmbientColor SunDiffuseColor SunFogAmount    SunFogColor     SunShadows      IsNight         LightingScheme  ShadowOpacity   FogClipDist     SkyBox          DayNightCycle   ChanceRain      ChanceSnow      ChanceLightning WindPower       LoadScreenID    PlayerVsPlayer  NoRest          Width           Height          OnEnter         OnExit          OnHeartbeat     OnUserDefined   Tileset         Tile_List       Tile_ID         Tile_OrientationTile_Height     Tile_MainLight1 Tile_MainLight2 Tile_SrcLight1  Tile_SrcLight2  Tile_AnimLoop1  Tile_AnimLoop2  Tile_AnimLoop3     Area001   ����          Area 001area001        tms01                            	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   -   .   /   0   1   2   3   4   5   6   7   8   9   :   ;   <   =   >   ?   @   A   B   C   D   E   F   G   H   I   J   K   L   M   N   O   P   Q   R   S   T   U   V   W   X   Y   Z   [   \   ]   ^   _   `   a   b   c   d   e   f   g   h   i   j   k   l   m   n   o   p   q   r   s   t   u   v   w   x   y   z   {   |   }   ~      �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �                      	  
                                               !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  [  \  ]  ^  _  `  a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                     	  
                                               !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  [  \  ]  ^  _  `  a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �      @                           	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   -   .   /   0   1   2   3   4   5   6   7   8   9   :   ;   <   =   >   ?   @   GIC V3.28      �      �  
   X  d  �  $   �  P   ����    	   	   	      	   
      	         	         	         	         	         	         	         	         	                                                                                             
   	       
   	   '   
   	   N   
   	   u   
   	   �   
   	   �   
   	   �   
   	   �   
   	   
  
   	     
   	   >  Creature List   Door List       Encounter List  List            SoundList       StoreList       TriggerList     WaypointList    Placeable List  Comment         #   Freestanding Merchant's Placard - 1#   Freestanding Merchant's Placard - 3#   Freestanding Merchant's Placard - 4   Signpost - 1#   Freestanding Merchant's Placard - 1#   Freestanding Merchant's Placard - 3#   Freestanding Merchant's Placard - 4   Signpost - 3   Signpost - 3    Chest - 4 (High treasure script)"   Chest - 3 (Medium treasure script)                                                                                       	   
      GIT V3.28      d    �%     �-    �8    �D  �   ����    
   d   (   	   	   L   6   	   $  6   	   �  6   	   �  6   	   �  6   	   �  6   	   \  6   	   4  6   	     6   	   �  6   	   �  7       �	  /       T
         p
        �
         �
                            <        X         �         �         �                                                                     "                        	   �_    
                                                                                
                !         S         �                               �                                                                                !   �      "          #           $          %          &           '          (       
   )   �       *          +   �      ,         -          .          /          0           1          2   �      3   �      4   �      5   �      6   �      7   �      8   �      9   �      :   �      ;   �      <   �      =   �       >           ?           @           A           B         C   �      D   �      E   4r�A   F   3�DB   G      7   H      �
      �         �         "        r                                                                                                             !   �      "          #           $          %          &           '          (       
   )   �      *          +   �      ,         -          .          /          0           1          2   �     3   �     4   �     5   �     6   �     7   �     8   �     9   �     :   �     ;   �     <   �     =   �      >           ?           @           A           B         C   �     D   �     E   �A   F   ��DB   G     �5   H      �
      �        �        �        A                              N                                                                               !   �      "          #           $          %          &           '          (       
   )   O      *          +   �      ,         -          .          /          0           1          2   S     3   T     4   U     5   V     6   W     7   X     8   Y     9   Z     :   [     ;   \     <   ]     =   ^      >           ?           @           A           B         C   _     D   `     E   �E�A   F   ��DB   G      7   H      �
      o        |        �        �                              �                                                                               !   �      "          #           $          %          &           '          (       
   )   �      *          +   W      ,         -          .          /          0           1          2   �     3   �     4   �     5   �     6   �     7   �     8   �     9   �     :   �     ;   �     <   �     =   �      >           ?           @           A           B         C   �     D   �     E   ��#B   F   !1B   G      7   H      �
      �        �        "        r                                                                                                             !   �      "          #           $          %          &           '          (       
   )   �      *          +   �      ,         -          .          /          0           1          2   �     3   �     4   �     5   �     6   �     7   �     8   �     9   �     :   �     ;   �     <   �     =   �      >           ?           @           A           B         C   �     D   �     E   �PB   F   ��FB   G      7   H      �
      �        �        �        ?                              L                                                                               !   �      "          #           $          %          &           '          (       
   )   M      *          +   �      ,         -          .          /          0           1          2   Q     3   R     4   S     5   T     6   U     7   V     8   W     9   X     :   Y     ;   Z     <   [     =   \      >           ?           @           A           B         C   ]     D   ^     E   ��]B   F   KGB   G      7   H      �
      o        �        �                                                                                                                     !   �      "          #           $          %          &           '          (       
   )         *          +   �      ,         -          .          /          0           1          2         3   !     4   "     5   #     6   $     7   %     8   &     9   '     :   (     ;   )     <   *     =   +      >           ?           @           A           B         C   ,     D   -     E   �ujB   F   (�FB   G      7   H      �
      >        K        y        �                              �                                                                               !   �      "          #           $          %           &           '          (      
   )   �      *          +   Y      ,         -          .          /          0           1          2   �     3   �     4   �     5   �     6   �     7   �     8   �     9   �     :   �     ;   �     <   �     =   �      >           ?           @           A           B         C   �     D   �     E   �kBB   F   {�FB   G      7   H      �
      �        �                z	                              �	                                                                               !   �      "          #           $          %           &           '          (      
   )   �	      *          +   Y      ,         -          .          /          0           1          2   �	     3   �	     4   �	     5   �	     6   �	     7   �	     8   �	     9   �	     :   �	     ;   �	     <   �	     =   �	      >           ?           @           A           B         C   �	     D   �	     E   ��B   F   �DFB   G      7   H      �
      �	        �	        �	        �	                              �	                                                                                !   p      "          #           $          %          &           '          (       
   )   �	      *          +   
      ,         -          .          /          0           1          2   �	     3   �	     4   �	     5   �	     6   �	     7   �	     8   �	     9   �	     :   �	     ;   �	     <   �	     =   �	      >          ?           @           A           B         C   �	     D   �	     E    �~B   F   V7B   G      7   H   �u�
      �	        �	        
        
                              &
                                                                                !   o      "          #           $          %          &           '          (       
   )   '
      *          +   	      ,         -          .          /          0           1          2   +
     3   ,
     4   -
     5   .
     6   /
     7   0
     8   1
     9   2
     :   3
     ;   4
     <   5
     =   6
      >          ?           @           A           B         C   7
     D   8
     E   ��wB   F   O,AB   G      7   H   �u�   I   P      J     ��   K     ��   L     ��   M          N     �?      9
     O         P   F
        R
     Q   ^
  
      j
      R          S   ��      T          U                    V           W           X           Y          Z          [          \          ]   
       ^   
       _          `          a          b          c          d          e          f          g          h          i          j          k           l   2       m   7       n          o          p   #       q         r   `      s         t           u         v          w   �       x   �       y   d      s   K      t           u          v           w   �       x           y   d      z          {          J     ��   K     ��   L     ��   M          N     �?      z
     O   K      P   �
        �
     Q   �
  
      �
      R          S         T          U                    V           W           X           |         r   l      s         t   F      u         v          w   �       x           y   d      s   ?      t          u          v           w   �       x           y   d      s   ?      t   	       u          v           w   �       x           y   d      s   ?      t   
       u          v           w   �       x           y   d      z         {          J     ��   K     ��   L     ��   M          N     �?      �
     O         P   �
        �
     Q   �
  
      �
      R          S   t^      T          U                    V           W           X           |          }          ~         r   �      s         t   �       u         v          w   �       x   �       y   d      s         t           u         v          w   �       x   �       y   d      s   ,      t           u         v          w   	       x          y   d      z         {       AreaProperties  AmbientSndDay   AmbientSndNight AmbientSndDayVolAmbientSndNitVolEnvAudio        MusicBattle     MusicDay        MusicNight      MusicDelay      Creature List   Door List       Encounter List  List            SoundList       StoreList       TriggerList     WaypointList    Placeable List  Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   HasInventory    BodyBag         Static          Type            Useable         OnInvDisturbed  OnUsed          X               Y               Z               Bearing         ItemList        XPosition       YPosition       ZPosition       XOrientation    YOrientation    BaseItem        LocalizedName   DescIdentified  Charges         Cost            Stolen          StackSize       AddCost         Identified      Cursed          ArmorPart_RFoot ArmorPart_LFoot ArmorPart_RShin ArmorPart_LShin ArmorPart_LThighArmorPart_RThighArmorPart_PelvisArmorPart_Torso ArmorPart_Belt  ArmorPart_Neck  ArmorPart_RFArm ArmorPart_LFArm ArmorPart_RBicepArmorPart_LBicepArmorPart_RShoulArmorPart_LShoulArmorPart_RHand ArmorPart_LHand ArmorPart_Robe  Leather1Color   Leather2Color   Cloth1Color     Cloth2Color     Metal1Color     Metal2Color     PropertiesList  PropertyName    Subtype         CostTable       CostValue       Param1          Param1Value     ChanceAppear    Repos_PosX      Repos_Posy      ModelPart1      ModelPart2      ModelPart3         FreestandingMerchantsPlacard2.   `9            Create database table "pwdata"L   _9         <   A carefully constructed marker denoting a point of interest.plc_placard1                  demo_createtable   FreestandingMerchantsPlacard3*   `9            Store variable in databaseL   b9         <   A carefully constructed marker denoting a point of interest.plc_placard3                  demo_storevalue   FreestandingMerchantsPlacard4+   `9            Load variable from databaseL   c9         <   A carefully constructed marker denoting a point of interest.plc_placard4                  demo_loadvalue	   Signpost1(   d            Instructions: Look at me   {9         �   This is the APS demo module.

It demonstrates how to store two types of data: Strings and objects. Check out the signpost to the left to learn how to store string data, and the signpost to the right on how to store objects to the database.
plc_signpost                      FreestandingMerchantsPlacard21   `9         !   Create database table "pwobjdata"L   _9         <   A carefully constructed marker denoting a point of interest.plc_placard1                  demo_obj_create   FreestandingMerchantsPlacard3)   `9            Store objects in databaseL   b9         <   A carefully constructed marker denoting a point of interest.plc_placard3                  demo_obj_storval   FreestandingMerchantsPlacard4*   `9            Load objects from databaseL   c9         <   A carefully constructed marker denoting a point of interest.plc_placard4                  demo_obj_loadval	   Signpost3*   d            Instructions 2: Look at me/  }9           There are three items in the left chest. The test consists of storing these items in the database, and retrieve them to the chest on the right.

1) Create a table pwobjdata with the first sign
2) Store the items in the database with the second sign
3) Retrieve them with the third sign.
plc_signpost3                   	   Signpost3*   d            Instructions 1: Look at men  }9         ^  The signs to the left demonstrate how NWNX ODBC stores persistent data in an SQL database. The test consists of creating a table in the database to hold the data, storing a string value, and retrieving it.

1) Create a table pwdata with the leftmost sign
2) Store the variable in the database with the second sign
3) Retrieve it with the third sign.
plc_signpost3                      Chest2   �            Chest 2   9      
plc_chest4                      Chest1   �            Chest 1   9      
plc_chest3                   nw_maarcl054   �5         ����       �5         NW_MAARCL054x2_it_sparscr602   �         ����       �         X2_IT_SPARSCR602nw_wswmgs005   �7         ����       �7         NW_WSWMGS005    
                                                   	                                              !   "   #   $   %   &   '   (   )   *   +   ,   -   .   /   0   1   2   3   4   5   6   7   8   9   :   ;   <   =   >   ?   @   A   B   C   D   E   F   G   H   I   J   K   L   M   N   O   P   Q   R   S   T   U   V   W   X   Y   Z   [   \   ]   ^   _   `   a   b   c   d   e   f   g   h   i   j   k   l   m   n   o   p   q   r   s   t   u   v   w   x   y   z   {   |   }   ~      �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �                      	  
                                               !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  [  \  ]  ^  _  `  a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                     	  
                                               !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  [  \  ]  ^  _  `  a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �      �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                                                               	   
                                                         ITP V3.28   =     y   �      	       	  �  �
    ����                                                               (          0          8          @          H          P          X          `          h          p          x          �          �          �          �          �          �          �          �          �          �          �          �          �          �          �          �                                                         (         0         8         @         H         P         X         `         h         p         x         �         �         �         �         �         �         �         �         �         �         �         �                      %                 �         0         &        L         '                  (                  )                  *                  �          	         8                  9                  :                          d         G         "         H         #         I         $         J         %         1        x         2                  3                  4                  5                  6                                    �          2         ,        �         -         
         .                  �         1         8                  ;        �         <                  =                  >                  +         /         ?                  /                  #        �         
                  B                  �                   D                  C                  k                   E         !         K        �                   &                   '                   (                   *                   )         !          +         #          ,         �          -                                              !                  "                  #                  $                  L         .   MAIN            STRREF          LIST            ID                                      	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   -   .   /   0   1   2   3   4   5   6   7   8   9   :   ;   <   =   >   ?   @   A   B   C   D   E   F   G   H   I   J   K   L   M   N   O   P   Q   R   S   T   U   V   W   X   Y   Z   [   \   ]   ^   _   `   a   b   c   d   e   f   g   h   i   j   k   l   m   n   o   p   q   r   s   t   u   v   w   x         -   6   <            	   
                        $   %                                                                               !   "   #      &   '   (   )   *   +   ,      .   /   0   1   2   3   4   5      7   8   9   :   ;   NCS V1.0B         DROP TABLE pwdata   � Table 'pwdata' deleted. J  v %Creating Table 'pwdata' for SQLite... J  v CREATE TABLE pwdata ( (player varchar(64) NOT NULL default '~',# %tag varchar(64) NOT NULL default '~',# &name varchar(64) NOT NULL default '~',# 	val text,# expire int(11) default NULL,# 2last timestamp NOT NULL default current_timestamp,# PRIMARY KEY (player,tag,name)# )#    - Table 'pwdata' created. J  v  ����  NWNX!ODBC!EXEC  �   9 ����  // Name     : Demo create table
// Purpose  : Create a table for persistent data
// Authors  : Ingmar Stieger
// Modified : February 02, 2005

// This file is licensed under the terms of the
// GNU GENERAL PUBLIC LICENSE (GPL) Version 2

#include "aps_include"

void main()
{
    SQLExecDirect("DROP TABLE pwdata");
    SendMessageToPC(GetLastUsedBy(), "Table 'pwdata' deleted.");

    // For SQLite
    SendMessageToPC(GetLastUsedBy(), "Creating Table 'pwdata' for SQLite...");
    SQLExecDirect("CREATE TABLE pwdata (" +
        "player varchar(64) NOT NULL default '~'," +
        "tag varchar(64) NOT NULL default '~'," +
        "name varchar(64) NOT NULL default '~'," +
        "val text," +
        "expire int(11) default NULL," +
        "last timestamp NOT NULL default current_timestamp," +
        "PRIMARY KEY (player,tag,name)" +
        ")");

    // For MySQL
    /*
    SendMessageToPC(GetLastUsedBy(), "Creating Table 'pwdata' for MySQL...");
    SQLExecDirect("CREATE TABLE pwdata (" +
        "player varchar(64) NOT NULL default '~'," +
        "tag varchar(64) NOT NULL default '~'," +
        "name varchar(64) NOT NULL default '~'," +
        "val text," +
        "expire int(11) default NULL," +
        "last timestamp NOT NULL default CURRENT_TIMESTAMP," +
        "PRIMARY KEY  (player,tag,name)" +
        ") ENGINE=MyISAM DEFAULT CHARSET=latin1;");
    */

    // For Access
    /*
    SendMessageToPC(GetLastUsedBy(), "Creating Table 'pwdata' for Access...");
    SQLExecDirect("CREATE TABLE pwdata (" +
                    "player text(64)," +
                    "tag text(64)," +
                    "name text(64)," +
                    "val memo," +
                    "expire text(4)," +
                    "last date)");
    */

    SendMessageToPC(GetLastUsedBy(), "Table 'pwdata' created.");
}
NCS V1.0B  �       pwdata demoName J     V����  ���� "Retrieved variable from database: ���� # J  v ����  ����   �    R����  s   �����  ��������   �   {����  ����    6-  ~����  ��������   �����  ��������    '����  ���� SELECT val FROM ���� #  WHERE player='#���� # ' AND tag='#���� # ' AND name='#���� # '#����  ��������    �           <      -   e����  ����    8 ����    &-   ����  ����     ���� ���� ����   '����   B        .���� ����  ����     ����      ����  ����    ����  �������� ����   ;     �   ���� ����   A����  ��������  '#    )����  ~#����  ����    (- ���� ���� #����  �������� $���� ���� ���L���� ����  ����     ���� ���� ����  ����  NWNX!ODBC!EXEC  �   9 ����    � ����  ���� NWNX!ODBC!SPACER����   5 NWNX!ODBC!FETCH����   9 NWNX!ODBC!FETCH����   5����  ��������   ;         Y����  NWNX_ODBC_CurrentRow����   9   ����  ����    c ����    Q-    NWNX_ODBC_CurrentRow����   9    ����  ����     ���� ����   NWNX_ODBC_CurrentRow  �   5����  ����    ����  ����  ����  ���� �����   B����  ��������     ����     ����          "���� ����  ����   B- ����           ����  ����   - ���� ����      ����� $���� �������� ����      /���� ����   ?����  ����    b- ����   ;����      ����   >����  ���� �����   B����  ��������         '����   ;����  ����     �������� ����  ����     ���� ���� ����   ~����   B        .���� ����  ����     ����      ����  ����    ����  �������� ����   ;     �   ���� ����   A����  ��������  ~#    )����  '#����  ����    (- ���� ���� #����  �������� $���� ���� ���L���� ����  ����     ���� ���� ����  // Name     : Demo load value
// Purpose  : Load a value from the database
// Authors  : Ingmar Stieger
// Modified : January 27, 2003

// This file is licensed under the terms of the
// GNU GENERAL PUBLIC LICENSE (GPL) Version 2

#include "aps_include"

void main()
{
    string sString = GetPersistentString(GetLastUsedBy(), "demoName");
    SendMessageToPC(GetLastUsedBy(), "Retrieved variable from database: " + sString);
}
NCS V1.0B  !       DROP TABLE pwobjdata   � Table 'pwobjdata' deleted. J  v (Creating Table 'pwobjdata' for SQLite... J  v CREATE TABLE pwobjdata ( (player varchar(64) NOT NULL default '~',# %tag varchar(64) NOT NULL default '~',# &name varchar(64) NOT NULL default '~',# 	val blob,# expire int(11) default NULL,# 2last timestamp NOT NULL default current_timestamp,# PRIMARY KEY (player,tag,name)# )#    0 Table 'pwobjdata' created. J  v  ����  NWNX!ODBC!EXEC  �   9 ����  // Name     : Demo create object table
// Purpose  : Create a table for persistent object data
// Authors  : Ingmar Stieger
// Modified : January 14, 2005

// This file is licensed under the terms of the
// GNU GENERAL PUBLIC LICENSE (GPL) Version 2

#include "aps_include"

void main()
{
    SQLExecDirect("DROP TABLE pwobjdata");
    SendMessageToPC(GetLastUsedBy(), "Table 'pwobjdata' deleted.");

    // For SQLite
    SendMessageToPC(GetLastUsedBy(), "Creating Table 'pwobjdata' for SQLite...");
    SQLExecDirect("CREATE TABLE pwobjdata (" +
        "player varchar(64) NOT NULL default '~'," +
        "tag varchar(64) NOT NULL default '~'," +
        "name varchar(64) NOT NULL default '~'," +
        "val blob," +
        "expire int(11) default NULL," +
        "last timestamp NOT NULL default current_timestamp," +
        "PRIMARY KEY (player,tag,name)" +
        ")");

    // For MySQL
    /*
    SendMessageToPC(GetLastUsedBy(), "Creating Table 'pwobjdata' for MySQL...");
    SQLExecDirect("CREATE TABLE pwobjdata (" +
        "player varchar(64) NOT NULL default '~'," +
        "tag varchar(64) NOT NULL default '~'," +
        "name varchar(64) NOT NULL default '~'," +
        "val blob," +
        "expire int(11) default NULL," +
        "last timestamp NOT NULL default CURRENT_TIMESTAMP," +
        "PRIMARY KEY  (player,tag,name)" +
        ") ENGINE=MyISAM DEFAULT CHARSET=latin1;");
    */

    SendMessageToPC(GetLastUsedBy(), "Table 'pwobjdata' created.");
}
NCS V1.0B  �         ����  ����     Chest1  �����  ����     Chest2  �����  ��������     � 	pwobjdata����  Item_����   \#����     �����  ��������   *"         ����  ����    - ���� $���� ���� ���b 
Retrieved ����   \#  objects from database.# $  v ����  ����   �    R����  s   �����  ��������   �   �����  ����    6-  ~����  ��������   �����  ��������    Q����  ���� SELECT val FROM ���� #  WHERE player='#���� # ' AND tag='#���� # ' AND name='#���� # '#����  ��������  NWNX!ODBC!SETSCORCOSQL  �   9����   *"    "���� ����  ����       ���� ����   � - NWNX [����  ����     ���� ���� ����   '����   B        .���� ����  ����     ����      ����  ����    ����  �������� ����   ;     �   ���� ����   A����  ��������  '#    )����  ~#����  ����    (- ���� ���� #����  �������� $���� ���� ���L���� ����  ����     ���� ���� ����  // Name     : Demo load value
// Purpose  : Load a value from the database
// Authors  : Ingmar Stieger
// Modified : January 1st, 2005

// This file is licensed under the terms of the
// GNU GENERAL PUBLIC LICENSE (GPL) Version 2

#include "aps_include"

void main()
{
    int iItem;
    int bContinue = TRUE;
    object oCreated;
    object oChest1 = GetObjectByTag("Chest1");
    object oChest2 = GetObjectByTag("Chest2");

    /* Method 1: GetPersistentObject
     *
     * Use this method for simplicity.
    */
    while (bContinue)
    {
        oCreated = GetPersistentObject(oChest1, "Item_" + IntToString(iItem), oChest2);
        if (!GetIsObjectValid(oCreated))
            bContinue = FALSE;
        else
            iItem++;
    }

    /* Method 2: Loop over resultset
     *
     * Use this method if you need the flexibility of SQL resultsets
    */
    /*
    string sSQL = "SELECT val FROM pwobjdata WHERE player='~'" +
        "AND tag='" + GetTag(oChest1) + "'";
    SetLocalString(GetModule(), "NWNX!ODBC!SETSCORCOSQL", sSQL);

    // The first call to RCO executes the SQL query and returns the first row.
    oCreated = RetrieveCampaignObject ("NWNX", "-", GetLocation(oChest2), oChest2);
    while (GetIsObjectValid(oCreated))
    {
        // "FETCHMODE" tells RCO to not execute the SQL statement again, but to
        // just advance to the next row in the resultset
        oCreated = RetrieveCampaignObject("NWNX", "FETCHMODE", GetLocation(oChest2), oChest2);
        iItem++;
    }
    */

    SendMessageToPC(GetFirstPC(), "Retrieved " + IntToString(iItem) + " objects from database.");
}
NCS V1.0B  l           Chest1  �����  ��������  S����  ��������   *    | 	pwobjdata    ����  Item_����   \#����     �����  T����  �������� $���� ���� ���} Stored ����   \#  objects in database.# $  v ����  ����   �    R����  s   J����  ��������   �   '����  ����    6-  ~����  ��������   �����  ��������    �����  ���� SELECT player FROM ���� #  WHERE player='#���� # ' AND tag='#���� # ' AND name='#���� # '#����  ��������    �   �        UPDATE ���� #  SET val=%s,expire=#����   \#  WHERE player='#���� # ' AND tag='#���� # ' AND name='#���� # '#����  ��������  NWNX!ODBC!SETSCORCOSQL  �   9   ����  - NWNX Z ����   -  INSERT INTO ���� # $ (player,tag,name,val,expire) VALUES# ('#���� # ','#���� # ','#���� # ',%s,#����   \# )#����  ��������  NWNX!ODBC!SETSCORCOSQL  �   9   ����  - NWNX Z ���� ���� ����   '����   B        .���� ����  ����     ����      ����  ����    ����  �������� ����   ;     �   ���� ����   A����  ��������  '#    )����  ~#����  ����    (- ���� ���� #����  �������� $���� ���� ���L���� ����  ����     ���� ���� ����  ����  NWNX!ODBC!EXEC  �   9 ����    � ����  ���� NWNX!ODBC!SPACER����   5 NWNX!ODBC!FETCH����   9 NWNX!ODBC!FETCH����   5����  ��������   ;         Y����  NWNX_ODBC_CurrentRow����   9   ����  ����    c ����    Q-    NWNX_ODBC_CurrentRow����   9    ����  ����     ���� ����  // Name     : Demo store object
// Purpose  : Store objects in the database
// Authors  : Ingmar Stieger
// Modified : January 1st, 2005

// This file is licensed under the terms of the
// GNU GENERAL PUBLIC LICENSE (GPL) Version 2

#include "aps_include"

void main()
{
    int iItem;
    object oChest = GetObjectByTag("Chest1");
    object oItem = GetFirstItemInInventory(oChest);

    while (GetIsObjectValid(oItem))
    {
        SetPersistentObject(oChest, "Item_" + IntToString(iItem), oItem);
        oItem = GetNextItemInInventory(oChest);
        iItem++;
    }

    SendMessageToPC(GetFirstPC(), "Stored " + IntToString(iItem) + " objects in database.");
}

NCS V1.0B  q       pwdata     	testValue demoName J     5 Stored 'testValue' in database. J  v  ����   �    R����  s    ����  ��������   �   �����  ����    6-  ~����  ��������   �����  ��������    �����  ��������    k����  ���� SELECT player FROM ���� #  WHERE player='#���� # ' AND tag='#���� # ' AND name='#���� # '#����  ��������    !   E        � UPDATE ���� # 
 SET val='#���� # 	',expire=#����   \#  WHERE player='#���� # ' AND tag='#���� # ' AND name='#���� # '#����  ��������    E    �-  INSERT INTO ���� # $ (player,tag,name,val,expire) VALUES# ('#���� # ','#���� # ','#���� # ','#���� # ',#����   \# )#����  ��������    t ���� ����   '����   B        .���� ����  ����     ����      ����  ����    ����  �������� ����   ;     �   ���� ����   A����  ��������  '#    )����  ~#����  ����    (- ���� ���� #����  �������� $���� ���� ���L���� ����  ����     ���� ���� ����  ����  NWNX!ODBC!EXEC  �   9 ����    � ����  ���� NWNX!ODBC!SPACER����   5 NWNX!ODBC!FETCH����   9 NWNX!ODBC!FETCH����   5����  ��������   ;         Y����  NWNX_ODBC_CurrentRow����   9   ����  ����    c ����    Q-    NWNX_ODBC_CurrentRow����   9    ����  ����     ���� ����  // Name     : Demo store value
// Purpose  : Store a value in the database
// Authors  : Ingmar Stieger
// Modified : January 27, 2003

// This file is licensed under the terms of the
// GNU GENERAL PUBLIC LICENSE (GPL) Version 2

#include "aps_include"

void main()
{
    SetPersistentString(GetLastUsedBy(), "demoName", "testValue");
    SendMessageToPC(GetLastUsedBy(), "Stored 'testValue' in database.");
}
ITP V3.28      �      �             X   t  8   ����                                                               (          0          8          @          H          P                                                            !                  "                  #                  $                  N                  O        (         P                  Q                  R            MAIN            STRREF          LIST            ID                                      	   
                                                                        	   
      ITP V3.28      �      �             X   t  4   ����                                                               (          0          8          @          H          P                       �                  �         	         �                  �                                                       !                  "                  #                  $                  �            MAIN            STRREF          ID              LIST                                    	   
                                                                        	   
   ITP V3.28   O   �  �   H     �      �  p  �  t  ����                                                               (          0          8          @          H          P          X          `          h          p          x          �          �          �          �          �          �          �          �          �          �          �          �          �          �          �          �                                                         (         0         8         @         H         P         X         `         h         p         x         �         �         �         �         �         �         �         �         �         �         �         �         �         �         �         �                                                        (         0         8         @         H         P         X         `         h                      O                  �                   �                  S         	         �                                    �         :         T        @         �                  U         
         V                  W        P         �         7         X                  �         ?         �         ;         �                  �         8         8        l         �         <         �         �         Y                  �                  Z                  [                  �                  �F        @         �         9         ]        �         ^                  _                  \                  +                  a                  b                  �         6                 �                             !                  "                  #                  $                  L         5         �        �         d        �         e                  f                  g                  �                j                   h                  i                  k                l         !         m         "         n         #         o         $         +         %         p         &         �        8        q         '         r         (         s         )         t         *         �         =         w         .         x         /         y        P        z         0         {         1         |         2         �         3         �        `        v         +         �         ,         �         -         �         >         �         4   MAIN            STRREF          LIST            ID                                      	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   -   .   /   0   1   2   3   4   5   6   7   8   9   :   ;   <   =   >   ?   @   A   B   C   D   E   F   G   H   I   J   K   L   M   N   O   P   Q   R   S   T   U   V   W   X   Y   Z   [   \   ]   ^   _   `   a   b   c   d   e   f   g   h   i   j   k   l   m   n   o   p   q   r   s   t   u   v   w   x   y   z   {   |   }   ~      �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �               $   %   +   ,                              	   
                           	                      !   "   #                                 &   '   (   )   *   
   -   1   5   <   B   C   D   H   I   N      .   /   0      2   3   4      6   7   8   9   :   ;      =   >   ?   @   A      E   F   G      J   K   L   M   ITP V3.28      X  0   �     �      �  �   �  h   ����                                                               (          0          8          @          H          P          X          `          h          p          x          �          �          �          �          �          �          �                                         ~                  �                  8         	         �         
         �                  �                  �#                  �#                          8                             !                  "                  #                  $                  �                  �                 P         �                  �                                   ��                  <                 }            MAIN            STRREF          ID              LIST                                    	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   -   .   /                              	   
                                                FAC V3.28      p  M        �  5   �  4  �  l   ����<                                      $         0          D         P         \         h         t         �         �         �         �      	   �      
   �         �         �         �         �         �                                 (                      ����
                         ����
                        ����
                        ����
                        ����
      )                                                                           2                            2                            2                           d                                                                                                                                           d                           2                           d                                                       2                           d                           d                                                       2                           d                           d   FactionList     FactionParentID FactionName     FactionGlobal   RepList         FactionID1      FactionID2      FactionRep         PC   Hostile   Commoner   Merchant   Defender                        	   
                                                                          !   "   #   $   %   &   '   (   )   *   +   ,   -   .   /   0   1   2   3   4   5   6   7   8   9   :   ;   <   =   >   ?   @   A   B   C   D   E   F   G   H   I   J   K   L                                 	   
                                                ITP V3.28      �            @      @  `   �  8   ����                                                               (          0          8          @          H          P          X                       &                  9�                  �                  �                  �                                                        !                  "                  #                  $                  �            MAIN            STRREF          ID              LIST                                    	   
                                                                              	   
      ITP V3.28      �      L     �      �  8   �  $   ����                                                               (          0                       �                                                       !                  "                  #                  $            MAIN            STRREF          ID              LIST                                    	   
                                          ITP V3.28      �      l     �      �  x   $  H   ����                                                               (          0          8          @          H          P          X          `          h          p                       :                  �                  �#                                                       !                  "                  #                  $                  �        0         ��                  �                  �                  �                  ��            MAIN            STRREF          ID              LIST                                    	   
                                                                              
                  	                     ITP V3.28      �      L     �      �  8   �  $   ����                                                               (          0                                                            !                  "                  #                  $                  �            MAIN            STRREF          LIST            ID                                      	   
                                          IFO V3.28      P   1   �  1   �  �   q  �   1     ����    0      .                 
                                              
      7         C              
   	   �      
   �         �#B      ��B         7      �
ɼ      C�?                                                                            \         
         �         �         �         �         �         �         �          �      !   �      "   �      #   �      $   �      %   �      &   �      '   �      (   �      )   �      *   �      +         ,         -         .   �      /         0      Mod_ID          Mod_MinGameVer  Mod_Creator_ID  Mod_Version     Expansion_Pack  Mod_Name        Mod_Tag         Mod_Description Mod_IsSaveGame  Mod_CustomTlk   Mod_Entry_Area  Mod_Entry_X     Mod_Entry_Y     Mod_Entry_Z     Mod_Entry_Dir_X Mod_Entry_Dir_Y Mod_Expan_List  Mod_DawnHour    Mod_DuskHour    Mod_MinPerHour  Mod_StartMonth  Mod_StartDay    Mod_StartHour   Mod_StartYear   Mod_XPScale     Mod_OnHeartbeat Mod_OnModLoad   Mod_OnModStart  Mod_OnClientEntrMod_OnClientLeavMod_OnActvtItem Mod_OnAcquirItemMod_OnUsrDefinedMod_OnUnAqreItemMod_OnPlrDeath  Mod_OnPlrDying  Mod_OnPlrEqItm  Mod_OnPlrLvlUp  Mod_OnSpawnBtnDnMod_OnPlrRest   Mod_OnPlrUnEqItmMod_OnCutsnAbortMod_StartMovie  Mod_CutSceneListMod_GVar_List   Mod_Area_list   Area_Name       Mod_HakList     Mod_CacheNSSList   c��!�K��*����   1.0   ����          aps_demo   aps_demoN   ����       >   This module shows how you can use APS/NWNX in your own module.    area001 
aps_onload                area001                            	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   -   /   0                             