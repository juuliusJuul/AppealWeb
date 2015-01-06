using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//using Microsoft.Ajax.Utilities;

/// <summary>
/// Summary description for mData
/// </summary>
public  class mData
{
   
   

    public static void CreatePerson(string name)
    {
        var db = new MyModelContext();
        tblPerson tp = new tblPerson();
        tp.PersonName = name;

        if (tp.PersonName == name)
        {

        }

        db.tblPersons.InsertOnSubmit(tp);
        db.SubmitChanges();
    }

    public static void CreateSubLaw(int cat, string name)
    {
        var db = new MyModelContext();
        tblSubLaw sl = new tblSubLaw();
        sl.SubLawName = name;
        sl.LawId = cat;
        db.tblSubLaws.InsertOnSubmit(sl);
        db.SubmitChanges();
    }

    //public static void CreateFileDoc(string fileName, string fileUrl)
    //{
        


    //}
    public static void CreateLawDoc(int law, int doc)
    {
        var db = new MyModelContext();
        tblLawDoc ld = new tblLawDoc();
        ld.DocId = doc;
        ld.LawId = law;
        db.tblLawDocs.InsertOnSubmit(ld);
        db.SubmitChanges();
    }



    public static void CreateCourt(string name)
    {
        var db = new MyModelContext();
        tblCourt tc = new tblCourt();
        tc.CourtName = name;
        db.tblCourts.InsertOnSubmit(tc);
        db.SubmitChanges();
    }

    public static void CreateDocument(string caseNr, int docYear, string docResume, string docResult, int docCourt,
        string head, int docPerson)
    {
        var db = new MyModelContext();
        tblDocument tp = new tblDocument();
        tp.DocNr = caseNr;
        tp.Docyear = docYear;
        tp.DocResume = docResume;
        tp.DocResult = docResult;
        tp.DocCourt = docCourt;
        tp.DocHeadText = head;
        tp.DocPerson = docPerson;
        tp.DocStart = DateTime.Now;
        tp.DocEnd = DateTime.Now;
        
        db.tblDocuments.InsertOnSubmit(tp);
        db.SubmitChanges();
    }

    public static void CreateYear(string year)
    {

        var db = new MyModelContext();
        tblYear y = new tblYear();
        y.YearName = year;
        db.tblYears.InsertOnSubmit(y);
        db.SubmitChanges();
    }


    public static void AddCategory(int cat, int dok)
    {
        var db = new MyModelContext();
        tblSubCategory sub = new tblSubCategory();
        sub.CategoryId = cat;
        sub.DocId = dok;
        db.tblSubCategories.InsertOnSubmit(sub);
        db.SubmitChanges();
    }

    public static void CreateSubject(string name)
    {
        var db = new MyModelContext();
        tblCategory c = new tblCategory();
        c.CategoryName = name;
        db.tblCategories.InsertOnSubmit(c);
        db.SubmitChanges();
    }

    public static DataTable GetDocumentByDocumentId(int DocId)
    {
        DataTable dtNew = null;
        SqlParameter[] parameter = new SqlParameter[1];
        parameter[0] = new SqlParameter("DocId", SqlDbType.Int);
        parameter[0].Value = DocId;
        DataAccess.CallCommand("SELECT * FROM tblDocument where DocId = @DocId", parameter);
        return dtNew;
    }






   






}