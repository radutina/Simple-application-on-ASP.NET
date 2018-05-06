using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TravelAgency
{
	public static class Helper
	{
		public static string GetControllerName(string fullname)
		{
			return fullname.Replace("Controller", "");
		}
	}
}