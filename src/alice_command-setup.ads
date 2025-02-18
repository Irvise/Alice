-------------------------------------------------------------------------------
--
--  ALICE - Adventures for Learning and Inspiring Coding Excellence
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gmail.com>
--  SPDX-License-Identifier: MIT
--
-------------------------------------------------------------------------------

with AAA.Strings;
with CLIC.Subcommand;

package Alice_Command.Setup is

   type Cmd_Type is new CLIC.Subcommand.Command with null record;

   overriding function Name
     (Cmd : Cmd_Type) return CLIC.Subcommand.Identifier is
     ("setup");

   overriding function Switch_Parsing
     (Cmd : Cmd_Type) return CLIC.Subcommand.Switch_Parsing_Kind is
     (CLIC.Subcommand.Parse_All);

   overriding procedure Execute
     (Cmd : in out Cmd_Type; Args : AAA.Strings.Vector);

   --!pp off
   pragma Style_Checks (off);
   overriding function Long_Description
     (Cmd : Cmd_Type) return AAA.Strings.Vector is
     (AAA.Strings.Empty_Vector
         .Append ("Creates a new Problem Source directory, populating it with all required")
         .Append ("files and libraries. It can retrieve the necessary resources form another")
         .Append ("repository.")
         .Append ("Available Problem Sources: project-euler")
     );
   pragma Style_Checks (on);
   --!pp on

   overriding procedure Setup_Switches
     (Cmd    : in out Cmd_Type;
      Config : in out CLIC.Subcommand.Switches_Configuration) is null;

   overriding function Short_Description (Cmd : Cmd_Type) return String is
     ("Setup problem source.");

   overriding function Usage_Custom_Parameters
     (Cmd : Cmd_Type) return String is
     ("[Problem Source]");

private

   function Is_Alice_Root_Dir return Boolean;
   function Alice return Boolean;
   function Project_Euler return Boolean;

end Alice_Command.Setup;
