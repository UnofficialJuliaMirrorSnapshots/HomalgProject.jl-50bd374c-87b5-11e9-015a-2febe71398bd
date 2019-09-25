using HomalgProject
using Test

@testset "HomalgProject.jl" begin
    LoadPackageAndExposeGlobals( "GradedModules", Main, all_globals = true )
    ℚ = HomalgFieldOfRationalsInSingular( )
    R = ℚ["x,y,z"]
    m = "[ x*y,y*z,z,0,0, x^3*z,x^2*z^2,0,x*z^2,-z^2, x^4,x^3*z,0,x^2*z,-x*z, 0,0,x*y,-y^2,x^2-1, 0,0,x^2*z,-x*y*z,y*z, 0,0,x^2*y-x^2,-x*y^2+x*y,y^2-y]";
    m = HomalgMatrix( m, 6, 5, R )
    @test NrRows( m ) == 6
    @test NrColumns( m ) == 5
    M = LeftPresentation( m )
    @test NrRelations( M ) == 6
    @test NrGenerators( M ) == 5
    FilteredByPurity( M )
    @test NrRelations( M ) == 12
    @test NrGenerators( M ) == 9
    @test RankOfObject( M ) == 2
    OnFirstStoredPresentation( M )
    @test NrRelations( M ) == 6
    @test NrGenerators( M ) == 5
    OnLastStoredPresentation( M )
    @test NrRelations( M ) == 12
    @test NrGenerators( M ) == 9
end
