using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Document
/// </summary>
public class Document
{
	public Document()
	{
        //this.Persons = new HashSet<Person>();

        this.SubDocuments = new HashSet<SubDocument>();
	}

    public int DocId { get; set; }
    public string DocNr { get; set; }
    public int DocYear { get; set; }
    public DateTime DocStart { get; set; }
    public DateTime DocEnd { get; set; }
    public string DocResume { get; set; }
    public string DocResult { get; set; }
    public int DocCourt { get; set; }
    //public ICollection<Person> Persons { get; set; } 
    public ICollection<SubDocument> SubDocuments { get; set; } 
}