% Compatibility launcher for Webots R2021b with recent MATLAB releases.
% R2021b caches a generated .m prototype and then passes its basename to
% loadlibrary on later launches. MATLAB R2026a interprets that basename as
% a missing header file. Regenerating this small prototype on every launch
% avoids the incompatible cached-code path.
webotsHome = getenv('WEBOTS_HOME');
if isempty(webotsHome)
    error('WEBOTS_HOME is not set. Start this controller from Webots.');
end
webotsVersion = getenv('WEBOTS_VERSION');
prototype = strrep(strrep(['protofile_matlab_' version('-release') ...
    '_webots_' webotsVersion], '.', '_'), ' ', '_');
prototypePath = fullfile(tempdir, [prototype '.m']);
if isfile(prototypePath)
    delete(prototypePath);
end
run(fullfile(webotsHome, 'lib', 'controller', 'matlab', 'launcher.m'));
