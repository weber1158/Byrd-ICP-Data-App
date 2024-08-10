function bib = str2bib(ref)
%Convert citation string into BibTeX
%
%DESCRIPTION
% Written specfically for citations in the Byrd  Data folder. This function
% would mostly like fail for citations written in any other style.
%
%SYNTAX
% bib = STR2BIB(ref)
%
%INPUT
% ref - citation as a string
%
%OUTPUT
% bib - citation in BibTeX formatting
%

% Copyright (C) 2024 Austin M. Weber


%=============
% AUTHORS
%=============
 authors = regexp(ref, '^[^0-9]+(?=\d{4}\.)', 'match');
 % Delete trailing period and space
  authors = authors{1};
  authors(end-1:end) = [];
 % FIRST AUTHOR
  firstAuthor = regexp(authors, '^[^,]+', 'match');
  firstAuthor = lower(firstAuthor{1});

%=============
% YEAR
%=============
 year = regexp(ref, '\d+', 'match', 'once'); % First instance of numbers
 
%=============
% TITLE
%=============
 title = regexp(ref, '(?<=\d{4}\.\s)(.*?)(?=\.\s)', 'match', 'once');
 
%=============
% VOLUME
%=============
 volume = regexp(ref, '(?<=,\s)\d+', 'match', 'once');
 if ismissing(volume)
   bib = [];
   msgbox('Sorry, this reference is not available in BibTeX because the manuscript is in review and lacks a journal volume ID.')
   return
 end
%=============
% JOURNAL
%=============
 
% Find the start position of the journal name
  startPos = strfind(ref, title + ". ") + length(char(title + ". "));
% Find the end position of the journal name
  endPos = strfind(ref, ", " + volume) - 1;
% Extract the journal name
  journal = extractBetween(ref, startPos, endPos);

%=============
% ISSUE
%=============
 issue = regexp(ref, '\((\d+)\)', 'tokens', 'once');

%=============
% DIGITAL OBJECT IDENTIFIER
%=============
 doi = regexp(ref, '(?<=doi:).*', 'match', 'once');
 doi = strrep(doi, ' ','');

%=============
% CONSTRUCT THE BIBTEX STRING
%=============
if isempty(issue)
 bib = sprintf('@article{%s,\n  author = {%s},\n  year = {%s},\n  title = {%s},\n journal = {%s},\n  volume = {%s},\n doi = {%s}}', ...
    firstAuthor+year,authors,year,title,journal,volume,doi);
else
 bib = sprintf('@article{%s,\n  author = {%s},\n  year = {%s},\n  title = {%s},\n journal = {%s},\n  volume = {%s},\n number = {%s},\n doi = {%s}}', ...
    firstAuthor+year,authors,year,title,journal,volume,issue,doi);
end

end