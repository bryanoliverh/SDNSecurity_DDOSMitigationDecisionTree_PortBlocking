def mycmd( self, line ):
    "mycmd is an example command to extend the Mininet CLI"
    net = self.mn
    output( 'mycmd invoked for', net, 'with line', line, '\n'  )
CLI.do_mycmd = mycmd