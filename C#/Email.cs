// Send an email in C#.

using System;
using System.Data;
using System.Web;
using System.Net.Mail;
using System.Net;

namespace Email
{

	public partial class _Default : System.Web.UI.Page
	{
		static void Main()
		{
			try
			{
				SmtpClient mailClient = new SmtpClient("smtp.gmail.com", 587);

				MailMessage MyMailMessage = new MailMessage("sowmyasri31.yelagandula@gmail.com", "sowmyasri_yelagandula@tecnics.com", "subject", "message");
				MyMailMessage.IsBodyHtml = false;
				NetworkCredential mailAuthentication = new NetworkCredential("sowmyasri31.yelagandula@gmail.com", "gfwgcdtrirhkbszh");

				mailClient.EnableSsl = true;
				mailClient.UseDefaultCredentials = false;
				mailClient.Credentials = mailAuthentication;
				mailClient.Send(MyMailMessage);
				Console.WriteLine("Email Sent");
			}
			catch (Exception ex)
			{
				Console.WriteLine(ex.ToString());
			}
		}
	}
}