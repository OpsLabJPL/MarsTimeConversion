import UIKit
import XCTest
import MarsTimeConversion

class Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
        let SPIRIT_WEST_LONGITUDE = 184.702
        let SPIRIT_LANDING_SECONDS_SINCE_1970_EPOCH = 1073137591.0
        
        let spiritLanding = NSDate(timeIntervalSince1970: SPIRIT_LANDING_SECONDS_SINCE_1970_EPOCH)
        let spiritJulian = MarsTimeConversion.getJulianDate(spiritLanding as Date)
        XCTAssertEqualWithAccuracy(2453008.07397, spiritJulian, accuracy: 0.00001, "Spirit landing julian date has invalid value.")
        
        let (jdut, tt_utc_diff, jdtt, deltaJ2000, marsMeanAnomaly, angleFictiousMeanSun, pbs, v_M_diff, ls, eot, msd, mtc, lmst, ltst) = MarsTimeConversion.getMarsTimes(spiritLanding as Date, longitude:SPIRIT_WEST_LONGITUDE)
       
        XCTAssertEqualWithAccuracy(2453008.07397, jdut, accuracy: 0.00001, "Spirit landing jdut invalid")
        
        XCTAssertEqualWithAccuracy(64.184, tt_utc_diff, accuracy: 0.001, "Spirit landing TT - UTC invalid")
        
        XCTAssertEqualWithAccuracy(2453008.07471, jdtt, accuracy: 0.00001, "Spirit landing jdtt invalid")
        
        XCTAssertEqualWithAccuracy(1463.07471, deltaJ2000, accuracy: 0.00001, "Spirit landing deltaJ2000 invalid")
        
        XCTAssertEqualWithAccuracy(786.06851, marsMeanAnomaly, accuracy: 0.00001, "Spirit mars mean anomaly invalid")
        
        XCTAssertEqualWithAccuracy(1037.09363, angleFictiousMeanSun, accuracy: 0.00001, "Spirit angleFicitiousMeanSun invalid")
        
        XCTAssertEqualWithAccuracy(0.01614, pbs, accuracy: 0.00001, "Spirit pbs invalid")
        
        XCTAssertEqualWithAccuracy(10.22959, v_M_diff, accuracy: 0.00001, "Spirit v - M invalid")
        
        XCTAssertEqualWithAccuracy(1047.32322, ls, accuracy: 0.00001, "Spirit ls invalid")
        
        XCTAssertEqualWithAccuracy(-12.77557, eot, accuracy: 0.00001, "Spirit EOT invalid")
        
        XCTAssertEqualWithAccuracy(46215.548559, msd, accuracy: 0.00001, "Spirit msd invalid")
        
        XCTAssertEqualWithAccuracy(13.165421, mtc, accuracy: 0.00001, "Spirit mtc invalid")
        
        XCTAssertEqualWithAccuracy(0.85195458, lmst, accuracy: 0.00001, "Spirit lmst invalid")

        XCTAssertEqualWithAccuracy(0.000249977, ltst, accuracy: 0.00001, "Spirit ltst invalid")
    }
    
    func testEarthTime() {
        XCTAssert(true, "Pass")
        print(MarsTimeConversion.getUTCTimeForMSL(911, hours: 7, minutes: 0, seconds: 0.0))
        print(MarsTimeConversion.getUTCTimeForMSL(911, hours: 19, minutes: 0, seconds: 0.0))
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
