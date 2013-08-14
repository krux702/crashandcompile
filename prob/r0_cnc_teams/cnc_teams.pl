#!/usr/bin/perl

# cnc_teams multi_sort
#
# Note: This solution replicates the method I used to
# solve the CNC Teams problem by hand.  While adding a
# resort between each round, to catch the edge test
# cases where a single sort does not work.
#
#                                             - krux

# for debugging
use Data::Dumper;

%team_members = ();
@teams = ();
@final_teams = ();

while(<>) {
   # strip trailing white space
   $_ =~ s/\s+$//;

   if(!$teamcount)
   {
     # get the team count
     $teamcount = $_ + 0;
     $i = 0;
   }
   else
   {
     $i++;

     if($i <= $teamcount)
     {
       # still expecting input
       $_ =~ /()/;
       if($_ =~ /(.*)\s&\s(.*)/)
       {
         push(@teams,{ name => $_ , member => $1 });
         push(@teams,{ name => $_ , member => $2 });
       }
       else
       {
         push(@teams,{ name => $_ , member => $_ });
         push(@teams,{ name => "$_" , member => "$_ - solo" });
       }
     }

     if($i eq $teamcount)
     {
       # received all expected input, now time to process it

       $searching = 1;
       while($searching)
       {
       
         # get count of number of teams each person is on
         %team_members=();
         $searching = 0;
         foreach $hashref (@teams)
         {
           $searching = 1;
           $team_members{${$hashref}{member}}++;
         }
         # print Dumper(\%team_members);
         # print Dumper(\@teams);

         # search for the person who is on the least number of teams
         $value = (sort {$team_members{$a} <=> $team_members{$b} } keys %team_members)[0];
         # print "$value\n";

         if($team_members{$value})
         {
           # matching teams
           if(@matching = grep { $_->{member} eq $value } @teams)
           {
             # add matching team to stack
             push(@final_teams,$matching[0]{name});

             # grab list of members for team
             @matching = grep { $_->{name} eq $matching[0]{name} } @teams;
             foreach $hashref (@matching)
             {
               $team_members{${$hashref}{member}} = 0;

               # for each team member 
               # find all teams that match
               # remove them from the list
               @matching_teams = grep { $_->{member} eq ${$hashref}{member} } @teams;
               foreach $hashref2 (@matching_teams)
               {
                 @teams = grep { $_->{name} ne ${$hashref2}{name} } @teams;
               }
             }
           }
         }
       }

       print ($#final_teams + 1);
       print " Teams\n";
#       print Dumper(\@final_teams);

       $teamcount = 0;
       %team_members = ();
       @teams = ();
       @final_teams = ();
     }
   }
}



