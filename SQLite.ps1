#
# SQLite.ps1 - IDM System PowerShell Script for SQLite Database
#
# Any IDM System PowerShell Script is dot-sourced in a separate PowerShell context, after
# dot-sourcing the IDM Generic PowerShell Script '../Generic.ps1'.
#


$Log_MaskableKeys = @(
    'password'
)


#
# System functions
#

function Idm-SystemInfo {
    param (
        # Operations
        [switch] $Connection,
        [switch] $TestConnection,
        [switch] $Configuration,
        # Parameters
        [string] $ConnectionParams
    )

    Log verbose "-Connection=$Connection -TestConnection=$TestConnection -Configuration=$Configuration -ConnectionParams='$ConnectionParams'"
    
    if ($Connection) {
        @(
            @{
                name = 'dllpath'
                type = 'textbox'
                label = 'DLL Path'
                description = 'Path to Driver DLL'
                value = 'C:\Tools4ever\dependencies\sqlite-netFx46-static-binary-bundle-x64-2015-1.0.118.0\System.Data.SQLite.dll'
            }
            @{
                name = 'path'
                type = 'textbox'
                label = 'File Path'
                description = 'Path to SQLite DB'
                value = ''
            }
            @{
                name = 'nr_of_sessions'
                type = 'textbox'
                label = 'Max. number of simultaneous sessions'
                description = ''
                value = 5
            }
            @{
                name = 'sessions_idle_timeout'
                type = 'textbox'
                label = 'Session cleanup idle time (minutes)'
                description = ''
                value = 30
            }
            @{
                name = 'table_1_name'
                type = 'textbox'
                label = 'Query 1 - Name of Table'
                description = ''
            }
            @{
                name = 'table_1_query'
                type = 'textbox'
                label = 'Query 1 - SQL Statement'
                description = ''
            }
            @{
                name = 'table_2_name'
                type = 'textbox'
                label = 'Query 2 - Name of Table'
                description = ''
            }
            @{
                name = 'table_2_query'
                type = 'textbox'
                label = 'Query 2 - SQL Statement'
                description = ''
            }
            @{
                name = 'table_3_name'
                type = 'textbox'
                label = 'Query 3 - Name of Table'
                description = ''
            }
            @{
                name = 'table_3_query'
                type = 'textbox'
                label = 'Query 3 - SQL Statement'
                description = ''
            }
            @{
                name = 'table_4_name'
                type = 'textbox'
                label = 'Query 4 - Name of Table'
                description = ''
            }
            @{
                name = 'table_4_query'
                type = 'textbox'
                label = 'Query 4 - SQL Statement'
                description = ''
            }
            @{
                name = 'table_5_name'
                type = 'textbox'
                label = 'Query 5 - Name of Table'
                description = ''
            }
            @{
                name = 'table_5_query'
                type = 'textbox'
                label = 'Query 5 - SQL Statement'
                description = ''
            }
            @{
                name = 'table_6_name'
                type = 'textbox'
                label = 'Query 6 - Name of Table'
                description = ''
            }
            @{
                name = 'table_6_query'
                type = 'textbox'
                label = 'Query 6 - SQL Statement'
                description = ''
            }
            @{
                name = 'table_7_name'
                type = 'textbox'
                label = 'Query 7 - Name of Table'
                description = ''
            }
            @{
                name = 'table_7_query'
                type = 'textbox'
                label = 'Query 7 - SQL Statement'
                description = ''
            }
            @{
                name = 'table_8_name'
                type = 'textbox'
                label = 'Query 8 - Name of Table'
                description = ''
            }
            @{
                name = 'table_8_query'
                type = 'textbox'
                label = 'Query 8 - SQL Statement'
                description = ''
            }
            @{
                name = 'table_9_name'
                type = 'textbox'
                label = 'Query 9 - Name of Table'
                description = ''
            }
            @{
                name = 'table_9_query'
                type = 'textbox'
                label = 'Query 9 - SQL Statement'
                description = ''
            }
            @{
                name = 'table_10_name'
                type = 'textbox'
                label = 'Query 10 - Name of Table'
                description = ''
            }
            @{
                name = 'table_10_query'
                type = 'textbox'
                label = 'Query 10 - SQL Statement'
                description = ''
            }
            @{
                name = 'table_11_name'
                type = 'textbox'
                label = 'Query 11 - Name of Table'
                description = ''
            }
            @{
                name = 'table_11_query'
                type = 'textbox'
                label = 'Query 11 - SQL Statement'
                description = ''
            }
            @{
                name = 'table_12_name'
                type = 'textbox'
                label = 'Query 12 - Name of Table'
                description = ''
            }
            @{
                name = 'table_12_query'
                type = 'textbox'
                label = 'Query 12 - SQL Statement'
                description = ''
            }
            @{
                name = 'table_13_name'
                type = 'textbox'
                label = 'Query 13 - Name of Table'
                description = ''
            }
            @{
                name = 'table_13_query'
                type = 'textbox'
                label = 'Query 13 - SQL Statement'
                description = ''
            }
            @{
                name = 'table_14_name'
                type = 'textbox'
                label = 'Query 14 - Name of Table'
                description = ''
            }
            @{
                name = 'table_14_query'
                type = 'textbox'
                label = 'Query 14 - SQL Statement'
                description = ''
            }
            @{
                name = 'table_15_name'
                type = 'textbox'
                label = 'Query 15 - Name of Table'
                description = ''
            }
            @{
                name = 'table_15_query'
                type = 'textbox'
                label = 'Query 15 - SQL Statement'
                description = ''
            }
            @{
                name = 'table_16_name'
                type = 'textbox'
                label = 'Query 16 - Name of Table'
                description = ''
            }
            @{
                name = 'table_16_query'
                type = 'textbox'
                label = 'Query 16 - SQL Statement'
                description = ''
            }
            @{
                name = 'table_17_name'
                type = 'textbox'
                label = 'Query 17 - Name of Table'
                description = ''
            }
            @{
                name = 'table_17_query'
                type = 'textbox'
                label = 'Query 17 - SQL Statement'
                description = ''
            }
            @{
                name = 'table_18_name'
                type = 'textbox'
                label = 'Query 18 - Name of Table'
                description = ''
            }
            @{
                name = 'table_18_query'
                type = 'textbox'
                label = 'Query 18 - SQL Statement'
                description = ''
            }
            @{
                name = 'table_19_name'
                type = 'textbox'
                label = 'Query 19 - Name of Table'
                description = ''
            }
            @{
                name = 'table_19_query'
                type = 'textbox'
                label = 'Query 19 - SQL Statement'
                description = ''
            }
            @{
                name = 'table_20_name'
                type = 'textbox'
                label = 'Query 20 - Name of Table'
                description = ''
            }
            @{
                name = 'table_20_query'
                type = 'textbox'
                label = 'Query 20 - SQL Statement'
                description = ''
            }

        )
    }

    if ($TestConnection) {
        Open-SQLiteConnection $ConnectionParams
    }

    if ($Configuration) {
        @()
    }

    Log verbose "Done"
}


function Idm-OnUnload {
    Close-SQLiteConnection
}

#
# CRUD functions
#

$ColumnsInfoCache = @{}

$SqlInfoCache = @{}

function Fill-SqlInfoCache {
    param (
        [switch] $Force,
        [string] $Query,
        [string] $Class
    )
    Log debug "Refresh Cache"
    # Refresh cache
    $sql_command = New-SQLiteCommand $Query

    $result = (Invoke-SQLiteCommand $sql_command) | Get-Member -MemberType Properties | Select-Object Name

    Dispose-SQLiteCommand $sql_command

    $objects = New-Object System.Collections.ArrayList
    $object = @{}
    # Process in one pass
    foreach ($row in $result) {
            $object = @{
                full_name = $Class
                type      = 'Query'
                columns   = New-Object System.Collections.ArrayList
            }

        $object.columns.Add(@{
            name           = $row.Name
            is_primary_key = $false
            is_identity    = $false
            is_computed    = $false
            is_nullable    = $true
        }) | Out-Null
    }

    if ($object.full_name -ne $null) {
        $objects.Add($object) | Out-Null
    }
    @($objects)
}


function Idm-Dispatcher {
    param (
        # Optional Class/Operation
        [string] $Class,
        [string] $Operation,
        # Mode
        [switch] $GetMeta,
        # Parameters
        [string] $SystemParams,
        [string] $FunctionParams
    )

    Log verbose "-Class='$Class' -Operation='$Operation' -GetMeta=$GetMeta -SystemParams='$SystemParams' -FunctionParams='$FunctionParams'"
    $connection_params = ConvertFrom-Json2 $SystemParams

    if ($Class -eq '') {

        if ($GetMeta) {
            #
            # Get all tables and views in database
            #
            Log debug "Getting meta - no class"
            Open-SQLiteConnection $SystemParams
            
            #
            # Output list of supported operations per table/view (named Class)
            #
            for (($i = 0), ($j = 0); $i -lt 21; $i++)
            {
                if($connection_params."table_$($i)_name".length -gt 0)
                {
                    @(
                        [ordered]@{
                            Class = $connection_params."table_$($i)_name"
                            Operation = 'Read'
                            'Source type' = 'Query'
                            'Primary key' = ''
                            'Supported operations' = 'R'
                            'Query' = $connection_params."table_$($i)_query"
                        }
                    )
                    }
            }
        }
        else {
            # Purposely no-operation.
        }

    }
    else {

        if ($GetMeta) {
            #
            # Get meta data
            #

            Open-SQLiteConnection $SystemParams
            Log debug "Getting meta"
            @()

        }
        else {
            #
            # Execute function
            #
            Log debug "Getting data"
            Open-SQLiteConnection $SystemParams

            for (($i = 0), ($j = 0); $i -lt 21; $i++)
            {
                if($connection_params."table_$($i)_name" -eq $class)
                {
                    $class_query = $connection_params."table_$($i)_query"
                    break
                }
            }
            
            $columns = Fill-SqlInfoCache -Query $class_query
            $Global:ColumnsInfoCache[$Class] = @{
                primary_keys = @($columns | Where-Object { $_.is_primary_key } | ForEach-Object { $_.name })
                identity_col = @($columns | Where-Object { $_.is_identity    } | ForEach-Object { $_.name })[0]
            }

            $primary_keys = $Global:ColumnsInfoCache[$Class].primary_keys
            $identity_col = $Global:ColumnsInfoCache[$Class].identity_col

            $function_params = ConvertFrom-Json2 $FunctionParams

            # Replace $null by [System.DBNull]::Value
            $keys_with_null_value = @()
            foreach ($key in $function_params.Keys) { if ($function_params[$key] -eq $null) { $keys_with_null_value += $key } }
            foreach ($key in $keys_with_null_value) { $function_params[$key] = [System.DBNull]::Value }

            $sql_command = New-SQLiteCommand

            $projection = if ($function_params['selected_columns'].count -eq 0) { '*' } else { @($function_params['selected_columns'] | ForEach-Object { "[$_]" }) -join ', ' }

            switch ($Operation) {
                'Read' {
                    $sql_command.CommandText = $class_query
                    break
                }
            }

            if ($sql_command.CommandText) {
                $deparam_command = DeParam-SQLiteCommand $sql_command

                LogIO info ($deparam_command -split ' ')[0] -In -Command $deparam_command

                if ($Operation -eq 'Read') {
                    # Streamed output
                    Invoke-SQLiteCommand $sql_command $deparam_command
                }
                else {
                    # Log output
                    $rv = Invoke-SQLiteCommand $sql_command $deparam_command
                    LogIO info ($deparam_command -split ' ')[0] -Out $rv

                    $rv
                }
            }

            Dispose-SQLiteCommand $sql_command

        }

    }

    Log verbose "Done"
}


#
# Helper functions
#

function New-SQLiteCommand {
    param (
        [string] $CommandText
    )

    New-Object System.Data.SQLite.SQLiteCommand($CommandText, $Global:SQLiteConnection)
}


function Dispose-SQLiteCommand {
    param (
        [System.Data.SQLite.SQLiteCommand] $SqlCommand
    )

    $SqlCommand.Dispose()
}


function AddParam-SQLiteCommand {
    param (
        [System.Data.SQLite.SQLiteCommand] $SqlCommand,
        $Param
    )

    $param_name = "@param$($SqlCommand.Parameters.Count)_"
    $SqlCommand.Parameters.AddWithValue($param_name, $Param) | Out-Null

    return $param_name
}


function DeParam-SQLiteCommand {
    param (
        [System.Data.SQLite.SQLiteCommand] $SqlCommand
    )

    $deparam_command = $SqlCommand.CommandText

    foreach ($p in $SqlCommand.Parameters) {
        $value_txt = 
            if ($p.Value -eq [System.DBNull]::Value) {
                'NULL'
            }
            else {
                switch ($p.SqlDbType) {
                    { $_ -in @(
                        [System.Data.SqlDbType]::Char
                        [System.Data.SqlDbType]::Date
                        [System.Data.SqlDbType]::DateTime
                        [System.Data.SqlDbType]::DateTime2
                        [System.Data.SqlDbType]::DateTimeOffset
                        [System.Data.SqlDbType]::NChar
                        [System.Data.SqlDbType]::NText
                        [System.Data.SqlDbType]::NVarChar
                        [System.Data.SqlDbType]::Text
                        [System.Data.SqlDbType]::Time
                        [System.Data.SqlDbType]::VarChar
                        [System.Data.SqlDbType]::Xml
                    )} {
                        "'" + $p.Value.ToString().Replace("'", "''") + "'"
                        break
                    }
        
                    default {
                        $p.Value.ToString().Replace("'", "''")
                        break
                    }
                }
            }

        $deparam_command = $deparam_command.Replace($p.ParameterName, $value_txt)
    }

    # Make one single line
    @($deparam_command -split "`n" | ForEach-Object { $_.Trim() } | Where-Object { $_ -ne '' }) -join ' '
}


function Invoke-SQLiteCommand {
    param (
        [System.Data.SQLite.SQLiteCommand] $SqlCommand,
        [string] $DeParamCommand
    )

    # Streaming
    function Invoke-SQLiteCommand-ExecuteReader {
        param (
            [System.Data.SQLite.SQLiteCommand] $SqlCommand
        )
        $data_reader = $SqlCommand.ExecuteReader()
        $column_names = @($data_reader.GetSchemaTable().ColumnName)

        if ($column_names) {

            $hash_table = [ordered]@{}

            foreach ($column_name in $column_names) {
                $hash_table[$column_name] = ""
            }

#           $obj = [PSCustomObject]$hash_table
            $obj = New-Object -TypeName PSObject -Property $hash_table

            # Read data
            while ($data_reader.Read()) {
                foreach ($column_name in $column_names) {
                    $obj.$column_name = if ($data_reader[$column_name] -is [System.DBNull]) { $null } else { $data_reader[$column_name] }
                }

                # Output data
                $obj
            }

        }

        $data_reader.Close()
    }

    if (! $DeParamCommand) {
        $DeParamCommand = DeParam-SQLiteCommand $SqlCommand
    }

    Log debug $DeParamCommand

    try {
        Invoke-SQLiteCommand-ExecuteReader $SqlCommand
    }
    catch {
        Log error "Failed: $_"
        Write-Error $_
    }

    Log debug "Done"
}


function Open-SQLiteConnection {
    param (
        [string] $ConnectionParams
    )

    $connection_params = ConvertFrom-Json2 $ConnectionParams

    if ($Global:SQLiteConnection -and $connection_string -ne $Global:SQLiteConnectionString) {
        Log verbose "SQLiteConnection connection parameters changed"
        Close-SQLiteConnection
    }

    if ($Global:SQLiteConnection -and $Global:SQLiteConnection.State -ne 'Open') {
        Log warn "SQLiteConnection State is '$($Global:SQLiteConnection.State)'"
        Close-SQLiteConnection
    }

    if ($Global:SQLiteConnection) {
        #Log debug "Reusing SQLiteConnection"
    }
    else {
        $connection_string = "Data Source=$($connection_params.path);Version=3;"
        Log verbose "Opening SQLiteConnection '$($connection_string)'"

        try {
            Add-Type -Path $connection_params.dllpath

            $connection = New-Object System.Data.SQLite.SQLiteConnection($connection_string)
            $connection.Open()

            $Global:SQLiteConnection       = $connection
            $Global:SQLiteConnectionString = $connection_string

            $Global:ColumnsInfoCache = @{}
            $Global:SqlInfoCache = @{}
        }
        catch {
            Log error "Failed: $_"
            Write-Error $_
        }

        Log verbose "Done"
    }
}


function Close-SQLiteConnection {
    if ($Global:SQLiteConnection) {
        Log verbose "Closing SQLiteConnection"

        try {
            $Global:SQLiteConnection.Close()
            $Global:SQLiteConnection = $null
        }
        catch {
            # Purposely ignoring errors
        }

        Log verbose "Done"
    }
}
