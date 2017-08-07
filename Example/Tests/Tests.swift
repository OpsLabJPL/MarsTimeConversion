// https://github.com/Quick/Quick

import Quick
import Nimble
import MarsTimeConversion

class MarsTimeConversionSpec: QuickSpec {
    
    override func spec() {
        super.spec()
        
        let SPIRIT_WEST_LONGITUDE = 184.702
        let SPIRIT_LANDING_SECONDS_SINCE_1970_EPOCH = 1073137591.0
        
        let spiritLanding = NSDate(timeIntervalSince1970: SPIRIT_LANDING_SECONDS_SINCE_1970_EPOCH)
        let spiritJulian = MarsTimeConversion.getJulianDate(spiritLanding as Date)

        describe("Spirit time conversion worked out example") {
            //from https://www.giss.nasa.gov/tools/mars24/help/algorithm.html


            it("has a valid date value") {
                expect(spiritJulian).to(beCloseTo(2453008.07397, within:0.00001))
            }
            let (jdut, tt_utc_diff, jdtt, deltaJ2000, marsMeanAnomaly, angleFictiousMeanSun, pbs, v_M_diff, ls, eot, msd, mtc, lmst, ltst) = MarsTimeConversion.getMarsTimes(spiritLanding as Date, longitude:SPIRIT_WEST_LONGITUDE)
            
            it("has the right jdut result") {
                expect(jdut).to(beCloseTo(2453008.07397, within:0.00001))
            }
            
            it("computed the difference of TT and UTC correctly") {
                expect(tt_utc_diff).to(beCloseTo(64.184, within:0.001))
            }
            
            it("has the right jdtt result") {
                expect(jdtt).to(beCloseTo(2453008.07471, within:0.00001))
            }
            
            it("has the right deltaJ2000 result") {
                expect(deltaJ2000).to(beCloseTo(1463.07471))
            }
            
            it("has the right mars mean anomaly result") {
                expect(marsMeanAnomaly).to(beCloseTo(786.06851, within:0.00001))
            }
            
            it("has the right angle ficticious mean Sun result") {
                expect(angleFictiousMeanSun).to(beCloseTo(1037.09363, within:0.00001))
            }
            
            it("has the right pbs result") {
                expect(pbs).to(beCloseTo(0.01614, within:0.00001))
            }
            
            it("has the right v - M result") {
                expect(v_M_diff).to(beCloseTo(10.22959, within:0.00001))
            }
            
            it("has the right LS result") {
                expect(ls).to(beCloseTo(1047.32322, within:0.00001))
            }
     
            it("has the right eot result") {
                expect(eot).to(beCloseTo(-12.77557, within:0.00001))
            }
            
            it("has the right msd result") {
                expect(msd).to(beCloseTo(46215.548559, within:0.00001))
            }
            
            it("has the right mtc result") {
                expect(mtc).to(beCloseTo(13.165421, within:0.00001))
            }
            
            it("has the right lmst result") {
                expect(lmst).to(beCloseTo(0.85195458, within:0.00001))
            }
            
            it("has the right ltst result") {
                expect(ltst).to(beCloseTo(0.000249977, within:0.00001))
            }
            

        }
        
        describe("Convert Curiosity time to Earth time") {
            it("has the right time conversion for sol 911 07:00") {
                expect(MarsTimeConversion.getUTCTimeForMSL(911, hours: 7, minutes: 0, seconds: 0.0).description)
                .to(equal("2015-02-27 22:05:42 +0000"))
            }
            
            it("has the right time conversion for sol 911 19:00") {
                expect(MarsTimeConversion.getUTCTimeForMSL(911, hours: 19, minutes: 0, seconds: 0.0).description)
                .to(equal("2015-02-28 10:25:30 +0000"))
            }
//            print(MarsTimeConversion.getUTCTimeForMSL(911, hours: 7, minutes: 0, seconds: 0.0))
//            print(MarsTimeConversion.getUTCTimeForMSL(911, hours: 19, minutes: 0, seconds: 0.0))
        }
    }
}
