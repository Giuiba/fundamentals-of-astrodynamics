using AGI.Foundation;
using AGI.Foundation.Coordinates;
using Lambert.Core;
using NUnit.Framework;

namespace TestHelper
{
    public class CssiCompare
    {
        public static CssiData LambertAlgo(Cartesian r1, Cartesian v1, Cartesian r2, double dtsec, int nRev, 
            DirectionOfMotionType motionDir,DirectionOfFlightType flightDir)
        {
            char dm = ConvertDirectionOfMotion(motionDir);
            char de = ConvertDirectionOfFlight(flightDir);
            var cssiLam = new AstroLambertkMethods.AstroLambertkLib();            
            cssiLam.lambertkmins1st(new double[] { r1.X, r1.Y, r1.Z }, new double[] { r2.X, r2.Y, r2.Z }, out double s, out double tau);
            cssiLam.lambertkmins(s, tau, nRev, dm, de, out double kbi, out double tof);
            cssiLam.lambertK(new double[] { r1.X, r1.Y, r1.Z },
                             new double[] { v1.X, v1.Y, v1.Z },
                             new double[] { r2.X, r2.Y, r2.Z },
                             dm,
                             de,
                             nRev,
                             0,
                             dtsec,
                             tof, 
                             kbi,
                             50,
                             0,
                             'n',
                             'n',
                             out double[] v1t,
                             out double[] v2t,
                             out double f,
                             out double g,
                             out double gdot,
                             out char hitearth,
                             out string errorStr,
                             out string detailSum,
                             out string detailAll
                             );
            var res = new CssiData();
            res.s = s;
            res.tau = tau;
            res.kbi = kbi;
            res.tof = tof;
            res.V1 = new Cartesian(v1t);
            res.V2 = new Cartesian(v2t);
            res.f = f;
            res.g = g;
            res.gdot = gdot;
            res.HitEarth = hitearth;
            res.Errors = errorStr;
            res.DetailSummary = detailSum;
            res.DetailAll = detailAll;
            return res;
        }

        private static char ConvertDirectionOfFlight(DirectionOfFlightType flightDir)
        {
            if (flightDir == DirectionOfFlightType.Direct) return 'L';
            if (flightDir == DirectionOfFlightType.Retrograde) return 'H';
            throw new ArgumentException(nameof(flightDir) + " is unsupported.");
        }

        private static char ConvertDirectionOfMotion(DirectionOfMotionType motionDir)
        {
            if (motionDir == DirectionOfMotionType.Short) return 'S';
            if (motionDir == DirectionOfMotionType.Long) return 'L';
            throw new ArgumentException(nameof(motionDir) + " is unsupported.");
        }

        public static Differences CalcDiffs(CssiData cssiResults, LambertKMinPoint? lkp, Tuple<Cartesian, Cartesian> results)
        {
            var diffs = new Differences();
            if (lkp != null)
            {
                diffs.kbi = cssiResults.kbi - lkp.K.Real;
                diffs.tof = cssiResults.tof - lkp.Tof.Real * LambertHelper.CanonTuSec;
            }
           
            diffs.V1 = cssiResults.V1 - results.Item1;
            diffs.V1Mag = (cssiResults.V1 - results.Item1).Magnitude;
            diffs.V2 = cssiResults.V2 - results.Item2;
            diffs.V2Mag = (cssiResults.V2 - results.Item2).Magnitude;
            return diffs;

        }

        public static bool CompareDiffs(Differences diffs, double tol1 = 1e-6, double tol2 = 1e-10)
        {
            try
            {
                Assert.IsTrue(diffs.kbi < tol2);
                Assert.IsTrue(diffs.tof < tol2);
                Assert.IsTrue(Math.Abs(diffs.V1.X) < tol1); //1 mm accuracy
                Assert.IsTrue(Math.Abs(diffs.V1.Y) < tol1);
                Assert.IsTrue(Math.Abs(diffs.V1.Z) < tol1);
                Assert.IsTrue(diffs.V1Mag < tol1);
                Assert.IsTrue(Math.Abs(diffs.V2.X) < tol1);
                Assert.IsTrue(Math.Abs(diffs.V2.Y) < tol1);
                Assert.IsTrue(Math.Abs(diffs.V2.Z) < tol1);
                Assert.IsTrue(diffs.V2Mag < tol1);
                return true;
            }
            catch
            {
                return false;
            }            
        }

    }



    public class CssiData
    {
        public double s { get; set; }
        public double tau { get; set; }
        public double kbi { get; set; }
        public double tof { get; set; }
        public Cartesian V1 { get; set; }
        public Cartesian V2 { get; set; }
        public double f { get; set; }
        public double g { get; set; }
        public double gdot { get; set; }
        public char HitEarth { get; set; }
        public string? Errors { get; set; }
        public string? DetailSummary { get; set; }
        public string? DetailAll { get; set; }
    }

    public class Differences
    {
      //  public double s { get; set; }
        //public double tau { get; set; }
        public double kbi { get; set; }
        public double tof { get; set; }
        public Cartesian V1 { get; set; }
        public double V1Mag { get; set; }
        public Cartesian V2 { get; set; }
        public double V2Mag { get; set; }
        //    public double f { get; set; }
        //   public double g { get; set; }
        //   public double gdot { get; set; }
        //   public char HitEarth { get; set; }
    }
    
}
